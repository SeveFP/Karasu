import 'package:flutter/material.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_loader.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/router.dart';
import 'package:karasu/widgets/shell_scaffold.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

/// Lessons view listing a course's lessons with the user's progress, a page
/// at a time.
class LessonsView extends StatefulWidget {
  final String courseId;
  final LessonService service;

  LessonsView({super.key, required this.courseId, LessonService? service})
    : service = service ?? LessonService.instance;

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> with RouteAware {
  final _logger = LoggerService.instance;
  final _scrollController = ScrollController();
  final List<api.BodylessLessonWithProgress> _lessons = [];
  String? _endCursor;
  bool _hasNextPage = false;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _isReloading = false;
  bool _reloadPending = false;
  bool _nextPageFailed = false;
  String? _error;
  String? _preloadedLessonId;
  Future<LoadedLesson>? _preloadedLesson;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchFirstPage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null) {
      AppRouter.routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    AppRouter.routeObserver.unsubscribe(this);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    _reloadShownLessons();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      _fetchNextPage();
    }
  }

  // A page shorter than the screen can't be scrolled, so the scroll listener
  // never asks for the next one.
  void _fetchNextPageIfNotScrollable() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      if (_scrollController.position.maxScrollExtent == 0) {
        _fetchNextPage();
      }
    });
  }

  // An empty page can't move the cursor forward, so it ends the paging even
  // if gate says there is more.
  bool _hasMore(api.BodylessLessonsWithProgressConnectionResponse page) {
    return page.pageInfo.hasNextPage && page.edges.isNotEmpty;
  }

  // Starts loading the current lesson in full, so it opens without waiting.
  // [refresh] loads it again even if it was already preloaded, because its
  // progress may have changed.
  void _preloadCurrentLesson({bool refresh = false}) {
    final current = _lessons.where((lesson) => lesson.isCurrent).firstOrNull;
    if (current == null) return;
    if (!refresh && current.id == _preloadedLessonId) return;

    _preloadedLessonId = current.id;
    _preloadedLesson = loadLesson(widget.service, widget.courseId, current.id)
      ..ignore();
  }

  Future<void> _fetchFirstPage() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final page = await widget.service.getLessons(widget.courseId);

      if (!mounted) return;

      setState(() {
        _lessons
          ..clear()
          ..addAll(page.edges.map((edge) => edge.node));
        _endCursor = page.pageInfo.endCursor;
        _hasNextPage = _hasMore(page);
        _isLoading = false;
      });
      _preloadCurrentLesson(refresh: true);
      _fetchNextPageIfNotScrollable();
    } catch (e) {
      _logger.e('Fetch lessons failed', error: e);

      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchNextPage() async {
    if (!_hasNextPage ||
        _isLoading ||
        _isLoadingMore ||
        _isReloading ||
        _nextPageFailed) {
      return;
    }

    setState(() => _isLoadingMore = true);

    try {
      final page = await widget.service.getLessons(
        widget.courseId,
        after: _endCursor,
      );

      if (!mounted) return;

      setState(() {
        _lessons.addAll(page.edges.map((edge) => edge.node));
        _endCursor = page.pageInfo.endCursor;
        _hasNextPage = _hasMore(page);
        _isLoadingMore = false;
      });
      _preloadCurrentLesson();
      _runPendingReload();
      _fetchNextPageIfNotScrollable();
    } catch (e) {
      _logger.e('Fetch next lessons failed', error: e);

      if (!mounted) return;
      setState(() {
        _isLoadingMore = false;
        _nextPageFailed = true;
      });
      _runPendingReload();
    }
  }

  void _retryNextPage() {
    setState(() => _nextPageFailed = false);
    _fetchNextPage();
  }

  // Refreshes the icons of every lesson shown, in one request. While a next
  // page loads, it waits for that page, so neither overwrites the other.
  Future<void> _reloadShownLessons() async {
    if (_isLoading || _isReloading) return;

    if (_isLoadingMore) {
      _reloadPending = true;
      return;
    }

    if (_lessons.isEmpty) {
      _fetchFirstPage();
      return;
    }

    _isReloading = true;
    try {
      final page = await widget.service.getLessons(
        widget.courseId,
        first: _lessons.length,
      );

      if (!mounted) return;

      setState(() {
        _lessons
          ..clear()
          ..addAll(page.edges.map((edge) => edge.node));
        _endCursor = page.pageInfo.endCursor;
        _hasNextPage = _hasMore(page);
      });
      _preloadCurrentLesson(refresh: true);
    } catch (e) {
      _logger.e('Reload lessons failed', error: e);
    } finally {
      _isReloading = false;
    }
  }

  void _runPendingReload() {
    if (!_reloadPending) return;

    _reloadPending = false;
    _reloadShownLessons();
  }

  void _selectLesson(api.BodylessLessonWithProgress lesson) {
    if (_getIsLocked(lesson)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.lessonLocked)),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      AppRouter.lesson,
      arguments: {
        'lesson': lesson,
        if (lesson.id == _preloadedLessonId) 'preloaded': _preloadedLesson,
      },
    );
  }

  // Determine if a lesson should be locked based on progress and config
  bool _getIsLocked(api.BodylessLessonWithProgress lesson) {
    if (lesson.isCompleted || lesson.isCurrent) {
      return false;
    }
    return ConfigService().config.lockLessons;
  }

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      title: AppLocalizations.of(context)!.lessonsTitle,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.failedToLoadLessons(_error ?? ''),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchFirstPage,
              child: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      );
    }

    if (_lessons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(97),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.noLessons,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.noLessonsDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: _lessons.length + (_isLoadingMore || _nextPageFailed ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _lessons.length && _nextPageFailed) {
          return Center(
            child: TextButton(
              onPressed: _retryNextPage,
              child: Text(AppLocalizations.of(context)!.retry),
            ),
          );
        }

        if (index == _lessons.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final lesson = _lessons[index];
        final currentLessonIcon = Icons.menu_book_rounded;
        final completedLessonIcon = Icons.check_circle_rounded;
        final lockedLessonIcon = Icons.lock;
        final availableLessonIcon = Icons.book_rounded;

        IconData icon;
        if (lesson.isCompleted) {
          icon = completedLessonIcon;
        } else if (lesson.isCurrent) {
          icon = currentLessonIcon;
        } else if (_getIsLocked(lesson)) {
          icon = lockedLessonIcon;
        } else {
          icon = availableLessonIcon;
        }

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(child: Icon(icon)),
            title: Text(lesson.title),
            subtitle: Text(lesson.description),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _selectLesson(lesson),
          ),
        );
      },
    );
  }
}
