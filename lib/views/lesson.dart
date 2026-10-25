import 'package:flutter/material.dart';
import 'package:karasu/router.dart';
import 'package:karasu/services/lesson_loader.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/services/openapi_client.dart';
import 'package:karasu/widgets/lesson_markdown.dart';
import 'package:karasu/widgets/shell_scaffold.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

// Enum for the BottomNextPageBar button state
// Completed, Complete and continue enabled, Complete and continue disabled
enum BottomNextPageBarButtonState {
  completedAndDisabled,
  completeAndContinueEnabled,
  completeAndContinueDisabled,
}

/// Individual lesson view displaying lesson content with embedded deck players.
/// Renders the lesson body as markdown supporting:
/// - ![audio](url) for audio playback
/// - ![deck](uuid) for interactive deck rounds
class LessonView extends StatefulWidget {
  /// The lesson as listed, without its body. The body is loaded by ID.
  final api.BodylessLessonWithProgress lesson;

  /// The lesson already loading in full, when the lessons screen preloaded it.
  final Future<LoadedLesson>? preloaded;
  final LessonService service;

  LessonView({
    super.key,
    required this.lesson,
    this.preloaded,
    LessonService? service,
  }) : service = service ?? LessonService.instance;

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  String? _error;
  String? _body;
  String? _bodyError;
  bool completedLessonInThisSession = false;
  late BottomNextPageBarButtonState completeLessonButtonState;
  Map<String, bool>? _deckStates = {};
  Map<String, api.Deck> _decks = {};
  bool _hasAnsweredCard = false;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load(usePreloaded: true);

    switch (widget.lesson.isCompleted) {
      case true:
        completeLessonButtonState =
            BottomNextPageBarButtonState.completedAndDisabled;
        break;
      case false:
        completeLessonButtonState =
            BottomNextPageBarButtonState.completeAndContinueDisabled;
        break;
    }
  }

  // The preloaded lesson is only used for the first load. Retry loads again.
  Future<void> _load({bool usePreloaded = false}) async {
    setState(() {
      _isLoading = true;
      _bodyError = null;
      _error = null;
    });

    try {
      final loaded = usePreloaded && widget.preloaded != null
          ? await widget.preloaded!
          : await loadLesson(
              widget.service,
              widget.lesson.courseId,
              widget.lesson.id,
            );
      if (!mounted) return;
      setState(() {
        _body = loaded.lesson.body;
        _deckStates = loaded.deckStates;
        _error = loaded.stateError?.toString();
        _decks = loaded.decks;
        _hasAnsweredCard = loaded.hasAnsweredCard;
        _isLoading = false;
      });
    } catch (e) {
      LoggerService.instance.e('_load: Failed to load lesson', error: e);
      if (!mounted) return;
      setState(() {
        _bodyError = e.toString();
        _isLoading = false;
      });
    }
  }

  void _onCompletedDeck(String deckId) async {
    setState(() => _hasAnsweredCard = true);

    try {
      final response = await OpenApiClient.instance.progress.getLessonState(
        courseId: widget.lesson.courseId,
        lessonId: widget.lesson.id,
      );

      final lessonNowCompleted = LessonService.instance.isLessonComplete(
        response.data!,
        widget.lesson.id,
      );

      if (lessonNowCompleted && !widget.lesson.isCompleted) {
        setState(() {
          completeLessonButtonState =
              BottomNextPageBarButtonState.completeAndContinueEnabled;
        });
      }
    } catch (e) {
      LoggerService.instance.e(
        '_onCompletedDeck: Failed to refresh lesson state',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      title: AppLocalizations.of(context)!.lessonsTitle,
      actions: [
        if (_hasAnsweredCard)
          IconButton(
            icon: const Icon(Icons.style_rounded),
            tooltip: AppLocalizations.of(context)!.reviewLesson,
            onPressed: () => Navigator.pushNamed(
              context,
              AppRouter.review,
              arguments: {'lessonId': widget.lesson.id},
            ),
          ),
      ],
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _bodyError != null
          ? _buildBodyError()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        AppLocalizations.of(
                          context,
                        )!.couldNotLoadProgress(_error ?? ''),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  if (widget.lesson.description.isNotEmpty) ...[
                    Text(
                      widget.lesson.description,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  LessonMarkdown(
                    data: _body!,
                    onCompletedDeck: _onCompletedDeck,
                    courseId: widget.lesson.courseId,
                    lessonId: widget.lesson.id,
                    deckStates: _deckStates,
                    decks: _decks,
                    forceResponsive: false,
                    responsiveTableStyle: ResponsiveTableStyle.stacked,
                  ),
                  // Bottom bar with a button on the right to back to the lessons list
                  BottomNextPageBar(
                    lesson: widget.lesson,
                    buttonState: completeLessonButtonState,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildBodyError() {
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
            AppLocalizations.of(context)!.failedToLoadLesson(_bodyError ?? ''),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _load(),
            child: Text(AppLocalizations.of(context)!.retry),
          ),
        ],
      ),
    );
  }
}

class BottomNextPageBar extends StatefulWidget {
  final api.BodylessLessonWithProgress lesson;
  final BottomNextPageBarButtonState buttonState;

  const BottomNextPageBar({
    super.key,
    required this.lesson,
    required this.buttonState,
  });

  @override
  State<BottomNextPageBar> createState() => _BottomNextPageBarState();
}

class _BottomNextPageBarState extends State<BottomNextPageBar> {
  bool _loading = false;

  // sync lesson state when completing the lesson
  void _syncState() async {
    setState(() => _loading = true);
    try {
      await OpenApiClient.instance.progress.syncState(
        courseId: widget.lesson.courseId,
      );
    } catch (e) {
      LoggerService.instance.e('_syncState: syncing state', error: e);
    } finally {
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    late ElevatedButton completeButton;

    switch (widget.buttonState) {
      case BottomNextPageBarButtonState.completedAndDisabled:
        completeButton = ElevatedButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: null,
          icon: const Icon(Icons.thumb_up),
          label: Text(AppLocalizations.of(context)!.lessonCompleted),
        );
        break;
      case BottomNextPageBarButtonState.completeAndContinueEnabled:
        completeButton = ElevatedButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: _loading ? null : _syncState,
          icon: _loading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.check),
          label: Text(AppLocalizations.of(context)!.completeLessonContinue),
        );
        break;
      case BottomNextPageBarButtonState.completeAndContinueDisabled:
        completeButton = ElevatedButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: null,
          icon: const Icon(Icons.check),
          label: Text(AppLocalizations.of(context)!.completeLessonContinue),
        );
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _loading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : completeButton,
        ],
      ),
    );
  }
}
