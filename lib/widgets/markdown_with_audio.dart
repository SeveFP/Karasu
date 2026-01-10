import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:karasu/widgets/markdown_builders.dart';

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
        md.ExtensionSet.gitHubFlavored.blockSyntaxes,
        [
          ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
          AudioSyntax(),
        ],
      ),
    );
  }
}
