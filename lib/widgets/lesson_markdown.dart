import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:karasu/widgets/markdown_builders.dart';
import 'package:karasu/widgets/responsive_table_builder.dart';

// Re-export for convenience
export 'package:karasu/widgets/responsive_table_builder.dart'
    show ResponsiveTableStyle;

/// Renders lesson markdown supporting custom inline tags:
/// - ![audio](url)
/// - ![deck](deck-id)
/// - Responsive tables (cards on mobile, table on desktop) when enabled
class LessonMarkdown extends StatelessWidget {
  final String data;

  /// Course ID for submitting deck answers. Optional for preview mode.
  final String? courseId;

  /// Lesson ID for submitting deck answers. Optional for preview mode.
  final String? lessonId;

  /// Map of deck ID to completion state. Used to show decks as already completed.
  final Map<String, bool>? deckStates;

  /// When true, tables transform on narrow screens.
  /// When false, uses standard MarkdownBody rendering.
  final bool enableResponsiveTables;

  /// Layout style for responsive tables on mobile.
  /// Only used when [enableResponsiveTables] is true.
  final ResponsiveTableStyle responsiveTableStyle;

  /// When true, always use responsive layout regardless of screen size.
  /// Useful for testing different styles on desktop.
  final bool forceResponsive;

  /// Callback called when a deck is completed.
  /// The deck ID is passed as a parameter.
  final void Function(String deckId) onCompletedDeck;

  const LessonMarkdown({
    super.key,
    required this.data,
    required this.onCompletedDeck,
    this.courseId,
    this.lessonId,
    this.deckStates,
    this.enableResponsiveTables = true,
    this.responsiveTableStyle = ResponsiveTableStyle.stacked,
    this.forceResponsive = false,
  });

  @override
  Widget build(BuildContext context) {
    if (enableResponsiveTables) {
      return ResponsiveMarkdownWrapper(
        markdownData: data,
        markdownBuilder: _buildMarkdown,
        tableStyle: responsiveTableStyle,
        forceResponsive: forceResponsive,
      );
    }
    return _buildMarkdown(data);
  }

  Widget _buildMarkdown(String markdownContent) {
    return MarkdownBody(
      data: markdownContent,
      imageBuilder: (uri, title, alt) => ProxiedImage(uri: uri, alt: alt),
      builders: {
        'audio': AudioBuilder(),
        'deck': DeckBuilder(
          onCompletedDeck: onCompletedDeck,
          courseId: courseId,
          lessonId: lessonId,
          deckStates: deckStates,
        ),
      },
      extensionSet:
          md.ExtensionSet(md.ExtensionSet.gitHubFlavored.blockSyntaxes, [
            ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
            AudioSyntax(),
            DeckSyntax(),
          ]),
    );
  }
}
