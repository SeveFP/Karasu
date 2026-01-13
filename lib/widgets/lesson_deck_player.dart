import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:karasu/api/lib/toshokan_api.dart' as api;
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
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

/// Lightweight deck runner for lesson embeds.
/// Submits answers to the backend when courseId and lessonId are provided.
class LessonDeckPlayer extends StatefulWidget {
  final api.Deck deck;

  /// Course ID for submitting answers. Optional for preview mode.
  final String? courseId;

  /// Lesson ID for submitting answers. Optional for preview mode.
  final String? lessonId;

  /// Whether the deck was already completed. If true, shows completed state initially.
  final bool initiallyCompleted;

 /// Callback when the deck is completed.
  final void Function(String deckId) onCompleted;

  const LessonDeckPlayer({
    super.key,
    required this.deck,
    required this.onCompleted,
    this.courseId,
    this.lessonId,
    this.initiallyCompleted = false,
  });

  @override
  State<LessonDeckPlayer> createState() => _LessonDeckPlayerState();
}

class _LessonDeckPlayerState extends State<LessonDeckPlayer> {
  late List<api.Card> _cards;
  final Map<String, api.Answer> _answers = {};
  int _current = 0;
  late bool _completed;
  bool _submitting = false;
  final _logger = LoggerService.instance;

  @override
  void initState() {
    super.initState();
    _cards = widget.deck.cards;
    _completed = widget.initiallyCompleted;

    // If initially completed, simulate all correct answers for display
    if (_completed) {
      for (final card in _cards) {
        final correctAnswer = card.possibleAnswers.firstWhere(
          (a) => a.isCorrect == true,
          orElse: () => card.possibleAnswers.first,
        );
        _answers[card.id] = correctAnswer;
      }
    }
  }

  Future<void> _submitAnswer(String cardId, api.Answer answer) async {
    if (widget.courseId == null || widget.lessonId == null) {
      _logger.w(
        'No courseId/lessonId provided - answer not submitted to backend',
      );
      return;
    }

    try {
      setState(() => _submitting = true);

      final cardAnswer = api.CardAnswer(cardId: cardId, answerId: answer.id);

      final response = await LessonService.instance.answerCards(
        courseId: widget.courseId!,
        lessonId: widget.lessonId!,
        deckId: widget.deck.id,
        answers: [cardAnswer],
      );

      _logger.d('Answer submitted: success=${response.success} ');
    } catch (e) {
      _logger.e('Failed to submit answer', error: e);
      // Don't block the UI on failure - answer is stored locally
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  void _handleTap(String cardID, api.Answer answer) {
    setState(() {
      _answers[cardID] = answer;
    });

    // Submit answer to backend (fire and forget)
    _submitAnswer(cardID, answer);

    // Move to next card after a short delay
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _current++;
          if (_current >= _cards.length) {
            _completed = true;
            widget.onCompleted(widget.deck.id);
          }
        });
      }
    });
  }

  void _restart() {
    setState(() {
      _answers.clear();
      _current = 0;
      _completed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cards.isEmpty) {
      return const Text('No cards available');
    }

    if (_completed) {
      final brightness = Theme.of(context).brightness;
      final statusColors = ConfigService().config.statusColors;
      final successColor = statusColors.getSuccessColor(brightness);
      final errorColor = statusColors.getErrorColor(brightness);

      final correctCount = _answers.values
          .where((a) => a.isCorrect == true)
          .length;
      final incorrectCount = _answers.length - correctCount;

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                widget.deck.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(widget.deck.description),
              leading: incorrectCount > 0
                  ? Icon(Icons.error, color: errorColor)
                  : Icon(Icons.check_circle, color: successColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Correct answers: $correctCount',
                    style: TextStyle(
                      color: successColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Incorrect answers: $incorrectCount',
                    style: TextStyle(
                      color: errorColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _restart,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    final api.Card card = _cards[_current];

    final colorScheme = Theme.of(context).colorScheme;
    final Widget deckHeader = Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: colorScheme.primaryContainer,
      child: ListTile(
        tileColor: colorScheme.primaryContainer,
        leading: Icon(Icons.library_books_rounded, color: colorScheme.onPrimaryContainer),
        title: Text(
          widget.deck.title,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: colorScheme.onPrimaryContainer),
        ),
        subtitle: Text(
          widget.deck.description,
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: colorScheme.onPrimaryContainer.withValues(alpha: 0.85)),
        ),
      ),
    );

    // Build card header (shared between card types)
    Widget cardHeader = ListTile(
      leading: const Icon(Icons.contact_support_rounded),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_submitting)
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
              '${_current + 1}/${_cards.length}',
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
      return Column(
        children: [
          deckHeader,
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                cardHeader,
                const Divider(height: 1),
                _FillInTheBlanksCard(
                  key: ValueKey(card.id), // ensure state resets when card changes
                  card: card,
                  disabled: _answers.containsKey(card.id),
                  allowSkip: ConfigService().isDebugMode,
                  onSubmit: (answer) {
                    if (_answers.containsKey(card.id)) return;
                    _handleTap(card.id, answer);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    // Render single-choice card (default)
    return Column(
      children: [
        deckHeader,
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              cardHeader,
              const Divider(height: 1),
              ...card.possibleAnswers.map(
                (a) => _AnswerDisplay(
                  answer: a,
                  disabled: _answers.containsKey(card.id),
                  active: _answers[card.id]?.id == a.id,
                  onChanged: (ans) {
                    // Allow choosing once per card
                    if (_answers.containsKey(card.id)) return;
                    _handleTap(card.id, ans);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnswerDisplay extends StatefulWidget {
  final api.Answer answer;
  final bool active;
  final bool disabled;
  final ValueChanged<api.Answer> onChanged;
  const _AnswerDisplay({
    required this.answer,
    required this.active,
    required this.disabled,
    required this.onChanged,
  });

  @override
  State<_AnswerDisplay> createState() => _AnswerDisplayState();
}

class _AnswerDisplayState extends State<_AnswerDisplay> {
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
        ? Icons.check_circle
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
class _FillInTheBlanksCard extends StatefulWidget {
  final api.Card card;
  final bool disabled;
  final bool allowSkip;
  final ValueChanged<api.Answer> onSubmit;

  const _FillInTheBlanksCard({
    super.key,
    required this.card,
    required this.disabled,
    required this.allowSkip,
    required this.onSubmit,
  });

  @override
  State<_FillInTheBlanksCard> createState() => _FillInTheBlanksCardState();
}

class _FillInTheBlanksCardState extends State<_FillInTheBlanksCard> {
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
      _errorMessage = 'Card missing correct or incorrect answer';
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
          'Input count ($inputCount) does not match blanks count (${_correctBlanks.length})';
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
          _errorMessage ?? 'Error parsing card',
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
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
