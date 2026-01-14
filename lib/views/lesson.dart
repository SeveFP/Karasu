import 'package:flutter/material.dart';
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
  final api.LessonWithProgress lesson;
  const LessonView({super.key, required this.lesson});

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  String? _error;
  bool completedLessonInThisSession = false;
  late BottomNextPageBarButtonState completeLessonButtonState;
  Map<String, bool>? _deckStates = {};

  // Removed misplaced code
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLessonState();

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

  Future<void> _fetchLessonState() async {
    try {
      final response = await LessonService.instance.getLessonState(
        widget.lesson.courseId,
        widget.lesson.id,
      );
      if (mounted) {
        setState(() {
          _deckStates = LessonService.instance.extractDeckStates(
            response,
            widget.lesson.id,
          );
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          LoggerService.instance.e(
            '_fetchLessonState: Failed to load lesson state',
            error: e,
          );
          _isLoading = false;
          _error = e.toString();
          // Default to empty map so decks still work
          _deckStates = {};
        });
      }
    }
  }

  void _onCompletedDeck(String deckId) async {
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
        // Removed misplaced code
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      title: AppLocalizations.of(context)!.lessonsTitle,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
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
                    data: widget.lesson.body,
                    onCompletedDeck: _onCompletedDeck,
                    courseId: widget.lesson.courseId,
                    lessonId: widget.lesson.id,
                    deckStates: _deckStates,
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
}

class BottomNextPageBar extends StatefulWidget {
  final api.LessonWithProgress lesson;
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
