import 'package:flutter/material.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/widgets/lesson_markdown.dart';
import 'package:karasu/widgets/shell_scaffold.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

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
  Map<String, bool>? _deckStates;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchLessonState();
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
          _error = e.toString();
          _isLoading = false;
          // Default to empty map so decks still work
          _deckStates = {};
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      title: widget.lesson.title,
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
                        'Could not load progress: $_error',
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
                    courseId: widget.lesson.courseId,
                    lessonId: widget.lesson.id,
                    deckStates: _deckStates,
                    forceResponsive: false,
                    responsiveTableStyle: ResponsiveTableStyle.stacked,
                  ),
                ],
              ),
            ),
    );
  }
}
