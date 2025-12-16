import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:karasu/widgets/audio_player_widget.dart';

class MarkdownWithAudio extends StatelessWidget {
  final String data;

  const MarkdownWithAudio({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      builders: {
        'audio': AudioBuilder(),
      },
      extensionSet: md.ExtensionSet(
        [],
        [AudioSyntax()],
      ),
    );
  }
}

class AudioBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementAfter(md.Element element, TextStyle? style) {
    return AudioPlayerWidget(url: element.textContent);
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
