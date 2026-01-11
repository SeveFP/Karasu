import 'package:flutter/material.dart';
import 'package:karasu/widgets/lesson_markdown.dart';
import 'package:karasu/widgets/responsive_container.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

/// Individual lesson view displaying lesson content with embedded deck players.
/// Renders the lesson body as markdown supporting:
/// - ![audio](url) for audio playback
/// - ![deck](uuid) for interactive deck rounds
class LessonView extends StatelessWidget {
  final api.LessonWithProgress lesson;

  const LessonView({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: ResponsiveBody(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (lesson.description.isNotEmpty) ...[
                Text(
                  lesson.description,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
              ],
              LessonMarkdown(
                data: lesson.body,
                courseId: lesson.courseId,
                lessonId: lesson.id,
                forceResponsive: false,
                responsiveTableStyle: ResponsiveTableStyle.stacked,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
