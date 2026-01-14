import 'package:flutter/material.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/router.dart';
import 'package:karasu/widgets/shell_scaffold.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

/// Lessons view showing focused lessons for a course.
class LessonsView extends StatefulWidget {
  final String courseId;

  const LessonsView({super.key, required this.courseId});

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> with RouteAware {
  final _logger = LoggerService.instance;
  final _service = LessonService.instance;
  final List<api.LessonWithProgress> _lessons = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchFocusedLessons();
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
    super.dispose();
  }

  @override
  void didPopNext() {
    _fetchFocusedLessons();
  }

  Future<void> _fetchFocusedLessons() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _service.getFocusedLessons(widget.courseId);
      final lessonEdges = response.edges;
      final lessons = lessonEdges.map((edge) => edge.node).toList();

      if (!mounted) return;

      setState(() {
        // TODO: Consider appropiate strategy once pagination is supported
        _lessons.clear();
        _lessons.addAll(lessons);
        _isLoading = false;
      });
    } catch (e) {
      _logger.e('Fetch lessons failed', error: e);

      if (!mounted) return;
      setState(() {
        _error = 'Failed to load lessons: $e';
        _isLoading = false;
      });
    }
  }

  void _selectLesson(api.LessonWithProgress lessonWithProgress) {
    if (_getIsLocked(lessonWithProgress)) {
      // The following solution works better than queuing snackbars everytime -
      // the user taps a locked lesson, but it is not the right solution.
      // Instead, there should be SnackBar types, and make the messenger not allow
      // pushing the same type again if it is already showing.
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'This lesson is locked. Please complete previous lessons first.',
          ),
        ),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      AppRouter.lesson,
      arguments: {'lesson': lessonWithProgress},
    );
  }

  // Determine if a lesson should be locked based on progress and config
  bool _getIsLocked(api.LessonWithProgress lesson) {
    if (lesson.isCompleted || lesson.isCurrent) {
      return false;
    }
    return ConfigService().config.lockLessons;
  }

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(title: 'Lessons', body: _buildBody());
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
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchFocusedLessons,
              child: const Text('Retry'),
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
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.38),
            ),
            const SizedBox(height: 24),
            Text(
              'No lessons',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'This course has no lessons yet',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _lessons.length,
      itemBuilder: (context, index) {
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
