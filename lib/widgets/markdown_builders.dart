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
  Widget visitElementAfter(md.Element element, TextStyle? style) {
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
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? style) {
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
          return LessonDeckPlayer(deck: snapshot.data!);
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
