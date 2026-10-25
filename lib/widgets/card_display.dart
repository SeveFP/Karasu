import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:karasu/api/lib/toshokan_api.dart' as api;
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/widgets/markdown_builders.dart';
import 'package:karasu/widgets/markdown_with_audio.dart';
import 'package:markdown/markdown.dart' as md;

/// Normalizes whitespace: trims and collapses multiple spaces to single.
String _normalizeWhitespace(String input) {
  return input.trim().replaceAll(RegExp(r'\s+'), ' ');
}

/// Compares two strings case-insensitively with normalized whitespace.
bool _matchesAnswer(String userInput, String expected) {
  return _normalizeWhitespace(userInput).toLowerCase() ==
      _normalizeWhitespace(expected).toLowerCase();
}

/// One card to answer: its question, a counter like "3/10", and its answers
/// (single choice) or blanks to fill in. Once [selected] is set, the card
/// can't be answered again.
class CardDisplay extends StatelessWidget {
  final api.Card card;
  final String counter;
  final bool submitting;
  final api.Answer? selected;
  final ValueChanged<api.Answer> onAnswer;

  const CardDisplay({
    super.key,
    required this.card,
    required this.counter,
    required this.onAnswer,
    this.submitting = false,
    this.selected,
  });

  void _answer(api.Answer answer) {
    // Allow choosing once per card
    if (selected != null) return;
    onAnswer(answer);
  }

  @override
  Widget build(BuildContext context) {
    // Build card header (shared between card types)
    Widget cardHeader = ListTile(
      leading: const Icon(Icons.contact_support_rounded),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (submitting)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              counter,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
      // For fill_in_the_blanks, title is rendered in the card body
      title: card.kind == api.CardKindEnum.fillInTheBlanks
          ? null
          : MarkdownWithAudio(data: card.title),
    );

    // Render fill-in-the-blanks card
    if (card.kind == api.CardKindEnum.fillInTheBlanks) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            cardHeader,
            const Divider(height: 1),
            FillInTheBlanksCard(
              key: ValueKey(card.id), // ensure state resets when card changes
              card: card,
              disabled: selected != null,
              allowSkip: ConfigService().isDebugMode,
              onSubmit: _answer,
            ),
          ],
        ),
      );
    }

    // Render single-choice card (default)
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          cardHeader,
          const Divider(height: 1),
          ...card.possibleAnswers.map(
            (a) => AnswerDisplay(
              answer: a,
              disabled: selected != null,
              active: selected?.id == a.id,
              onChanged: _answer,
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerDisplay extends StatefulWidget {
  final api.Answer answer;
  final bool active;
  final bool disabled;
  final ValueChanged<api.Answer> onChanged;
  const AnswerDisplay({
    super.key,
    required this.answer,
    required this.active,
    required this.disabled,
    required this.onChanged,
  });

  @override
  State<AnswerDisplay> createState() => AnswerDisplayState();
}

class AnswerDisplayState extends State<AnswerDisplay> {
  bool _locked = false;
  bool _hovered = false;

  void _handleTap() {
    if (_locked || widget.disabled) return;
    setState(() => _locked = true);
    widget.onChanged(widget.answer);
    Timer(const Duration(milliseconds: 400), () {
      if (mounted) setState(() => _locked = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool active = widget.active;
    final bool disabled = widget.disabled || _locked;
    final theme = Theme.of(context);

    // Use theme colors instead of hardcoded values
    final activeColor = theme.colorScheme.primary;
    final inactiveColor = theme.colorScheme.outline;
    final hoverColor = theme.colorScheme.onSurfaceVariant;

    // Determine icon color based on state priority: active > hover > inactive
    final iconColor = active
        ? activeColor
        : (_hovered && !disabled)
        ? hoverColor
        : inactiveColor;

    // Determine icon based on state
    final IconData icon = active
        ? (widget.answer.isCorrect == true ? Icons.check_circle : Icons.cancel)
        : (_hovered && !disabled)
        ? Icons.radio_button_checked
        : Icons.circle_outlined;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedOpacity(
        opacity: !disabled ? 1.0 : 0.35,
        duration: const Duration(milliseconds: 150),
        child: ListTile(
          onTap: _handleTap,
          title: MarkdownWithAudio(data: widget.answer.text),
          trailing: Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}

/// Fill-in-the-blanks card widget.
/// Uses markdown rendering with custom ![input](n) syntax for inline inputs.
class FillInTheBlanksCard extends StatefulWidget {
  final api.Card card;
  final bool disabled;
  final bool allowSkip;
  final ValueChanged<api.Answer> onSubmit;

  const FillInTheBlanksCard({
    super.key,
    required this.card,
    required this.disabled,
    required this.allowSkip,
    required this.onSubmit,
  });

  @override
  State<FillInTheBlanksCard> createState() => FillInTheBlanksCardState();
}

class FillInTheBlanksCardState extends State<FillInTheBlanksCard> {
  final _logger = LoggerService.instance;
  late List<String> _correctBlanks;
  late api.Answer _correctAnswer;
  late api.Answer _incorrectAnswer;
  late List<TextEditingController> _controllers;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _parseCard();
  }

  void _parseCard() {
    // Find correct and incorrect answers
    final correctAnswers = widget.card.possibleAnswers
        .where((a) => a.isCorrect == true)
        .toList();
    final incorrectAnswers = widget.card.possibleAnswers
        .where((a) => a.isCorrect != true)
        .toList();

    if (correctAnswers.isEmpty || incorrectAnswers.isEmpty) {
      _hasError = true;
      _errorMessage = AppLocalizations.of(context)!.errorParsingCard;
      _logger.e(_errorMessage!);
      _correctBlanks = [];
      _controllers = [];
      return;
    }

    _correctAnswer = correctAnswers.first;
    _incorrectAnswer = incorrectAnswers.first;

    // Parse correct blanks from semicolon-separated text
    _correctBlanks = _correctAnswer.text.split(';');

    // Count input markers in the title
    final inputPattern = RegExp(r'!\[input\]\((\d+)\)');
    final inputCount = inputPattern.allMatches(widget.card.title).length;

    // Validate counts match
    if (inputCount != _correctBlanks.length) {
      _hasError = true;
      _errorMessage =
          "Input count mismatch: $inputCount vs ${_correctBlanks.length}";
      _logger.e(_errorMessage!);
      _controllers = [];
      return;
    }

    // Initialize controllers for each input
    _controllers = List.generate(
      _correctBlanks.length,
      (_) => TextEditingController(),
    );

    // Listen for changes to update submit button state
    for (final controller in _controllers) {
      controller.addListener(_onInputChanged);
    }
  }

  void _onInputChanged() {
    setState(() {}); // Trigger rebuild to update submit button state
  }

  bool get _allInputsFilled {
    return _controllers.every((c) => c.text.trim().isNotEmpty);
  }

  bool get _canSubmit {
    if (widget.allowSkip) return true;
    return _allInputsFilled;
  }

  void _handleSubmit() {
    if (widget.disabled) return;

    // Validate all inputs against correct blanks
    bool allCorrect = true;
    for (int i = 0; i < _controllers.length; i++) {
      if (!_matchesAnswer(_controllers[i].text, _correctBlanks[i])) {
        allCorrect = false;
        break;
      }
    }

    // Submit the appropriate answer
    final answer = allCorrect ? _correctAnswer : _incorrectAnswer;
    widget.onSubmit(answer);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.removeListener(_onInputChanged);
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          _errorMessage ?? AppLocalizations.of(context)!.errorParsingCard,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    return AnimatedOpacity(
      opacity: widget.disabled ? 0.5 : 1.0,
      duration: const Duration(milliseconds: 150),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Render title as markdown with inline inputs
            MarkdownBody(
              data: widget.card.title,
              builders: {
                'audio': AudioBuilder(),
                'input': InputBuilder(
                  controllers: _controllers,
                  expectedAnswers: _correctBlanks,
                  disabled: widget.disabled,
                ),
              },
              extensionSet: md.ExtensionSet(
                md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                [
                  ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
                  AudioSyntax(),
                  InputSyntax(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Submit button
            Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: FilledButton(
                  onPressed: _canSubmit && !widget.disabled
                      ? _handleSubmit
                      : null,
                  child: Text(AppLocalizations.of(context)!.submitButton),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
