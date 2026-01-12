import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;
import 'package:markdown/markdown.dart' as md;
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/signed_url_service.dart';
import 'package:karasu/widgets/audio_player_widget.dart';
import 'package:karasu/widgets/lesson_deck_player.dart';

/// Shared markdown builders and syntax extensions for audio, images, and decks.

// ============================================================================
// Audio Builder & Syntax
// ============================================================================

class AudioBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final originalUrl = element.textContent;
    return FutureBuilder<String>(
      future: SignedUrlService.instance.resolve(originalUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final resolved = snapshot.data ?? originalUrl;
        return AudioPlayerWidget(url: resolved);
      },
    );
  }
}

class AudioSyntax extends md.InlineSyntax {
  AudioSyntax() : super(r'\!\[audio\]\(([^\)]+)\)');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final url = match.group(1)!;
    final el = md.Element('audio', [md.Text(url)]);
    parser.addNode(el);
    return true;
  }
}

// ============================================================================
// Deck Builder & Syntax
// ============================================================================

class DeckBuilder extends MarkdownElementBuilder {
  final String? courseId;
  final String? lessonId;
  final Map<String, bool>? deckStates;

  DeckBuilder({this.courseId, this.lessonId, this.deckStates});

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final deckId = element.textContent;
    if (deckId.isEmpty) return const SizedBox.shrink();
    final future = LessonService.instance.getDeck(deckId);
    return FutureBuilder<api.Deck>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            color: Theme.of(context).colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deck not found',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.onErrorContainer,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'ID: $deckId',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(
                              context,
                            ).colorScheme.onErrorContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          final deck = snapshot.data!;
          final isCompleted = deckStates?[deck.id] ?? false;
          return LessonDeckPlayer(
            deck: deck,
            courseId: courseId,
            lessonId: lessonId,
            initiallyCompleted: isCompleted,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class DeckSyntax extends md.InlineSyntax {
  DeckSyntax() : super(r'!\[deck\]\(([^\)]+)\)');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final id = match.group(1)!;
    final el = md.Element('deck', [md.Text(id)]);
    parser.addNode(el);
    return true;
  }
}

// ============================================================================
// Proxied Image Widget (for imageBuilder)
// ============================================================================

class ProxiedImage extends StatefulWidget {
  final Uri uri;
  final String? alt;

  const ProxiedImage({super.key, required this.uri, this.alt});

  @override
  State<ProxiedImage> createState() => _ProxiedImageState();
}

class _ProxiedImageState extends State<ProxiedImage> {
  late Future<String> _resolved;

  @override
  void initState() {
    super.initState();
    _resolved = SignedUrlService.instance.resolve(widget.uri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _resolved,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }
        final url = snapshot.data ?? widget.uri.toString();
        return Image.network(
          url,
          errorBuilder: (context, error, stackTrace) =>
              Text(widget.alt ?? 'Image failed to load'),
        );
      },
    );
  }
}

// ============================================================================
// Input Builder & Syntax (for fill-in-the-blanks cards)
// ============================================================================

/// Builder for inline input fields in fill-in-the-blanks cards.
/// Renders ![input](n) as a text input field.
class InputBuilder extends MarkdownElementBuilder {
  final List<TextEditingController> controllers;
  final List<String> expectedAnswers;
  final bool disabled;

  InputBuilder({
    required this.controllers,
    required this.expectedAnswers,
    required this.disabled,
  });

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final indexStr = element.textContent;
    final index = int.tryParse(indexStr) ?? 0;

    if (index >= controllers.length || index >= expectedAnswers.length) {
      return const SizedBox.shrink();
    }

    final expectedLength = expectedAnswers[index].length;
    return BlankInputWidget(
      controller: controllers[index],
      expectedLength: expectedLength,
      disabled: disabled,
    );
  }
}

class InputSyntax extends md.InlineSyntax {
  InputSyntax() : super(r'!\[input\]\((\d+)\)');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final index = match.group(1)!;
    final el = md.Element('input', [md.Text(index)]);
    parser.addNode(el);
    return true;
  }
}

/// Inline text input widget for fill-in-the-blanks.
class BlankInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final int expectedLength;
  final bool disabled;

  const BlankInputWidget({
    super.key,
    required this.controller,
    required this.expectedLength,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Calculate width based on expected answer length
    // Minimum 3 characters, add some padding
    final charCount = expectedLength.clamp(3, 20);
    final width = (charCount * 12.0) + 16;

    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: TextField(
        controller: controller,
        enabled: !disabled,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          border: const UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.outline, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
