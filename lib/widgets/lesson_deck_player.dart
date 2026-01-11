import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karasu/api/lib/toshokan_api.dart' as api;
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/widgets/markdown_with_audio.dart';

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

  const LessonDeckPlayer({
    super.key,
    required this.deck,
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
      return Card(
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

    return AnimatedOpacity(
      opacity: !disabled ? 1.0 : 0.35,
      duration: const Duration(milliseconds: 150),
      child: ListTile(
        onTap: _handleTap,
        title: MarkdownWithAudio(data: widget.answer.text),
        trailing: Icon(Icons.circle, color: active ? Colors.blue : Colors.grey),
      ),
    );
  }
}

/// Parsed segment of a fill-in-the-blanks title.
sealed class _TitleSegment {}

class _TextSegment extends _TitleSegment {
  final String text;
  _TextSegment(this.text);
}

class _InputSegment extends _TitleSegment {
  final int index;
  _InputSegment(this.index);
}

/// Fill-in-the-blanks card widget.
/// Parses ![input](n) syntax and renders inline text inputs.
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
  late List<_TitleSegment> _segments;
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
      _segments = [];
      _correctBlanks = [];
      _controllers = [];
      return;
    }

    _correctAnswer = correctAnswers.first;
    _incorrectAnswer = incorrectAnswers.first;

    // Parse correct blanks from semicolon-separated text
    _correctBlanks = _correctAnswer.text.split(';');

    // Parse title for ![input](n) markers
    _segments = _parseTitleSegments(widget.card.title);

    // Count input segments
    final inputCount = _segments.whereType<_InputSegment>().length;

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

  List<_TitleSegment> _parseTitleSegments(String title) {
    final segments = <_TitleSegment>[];
    final pattern = RegExp(r'!\[input\]\((\d+)\)');
    int lastEnd = 0;

    for (final match in pattern.allMatches(title)) {
      // Add text before this match
      if (match.start > lastEnd) {
        segments.add(_TextSegment(title.substring(lastEnd, match.start)));
      }
      // Add input segment
      final index = int.parse(match.group(1)!);
      segments.add(_InputSegment(index));
      lastEnd = match.end;
    }

    // Add remaining text after last match
    if (lastEnd < title.length) {
      segments.add(_TextSegment(title.substring(lastEnd)));
    }

    return segments;
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

    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge;

    return AnimatedOpacity(
      opacity: widget.disabled ? 0.5 : 1.0,
      duration: const Duration(milliseconds: 150),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with inline inputs
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: _buildTitleWidgets(textStyle),
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

  List<Widget> _buildTitleWidgets(TextStyle? textStyle) {
    final widgets = <Widget>[];
    int inputIndex = 0;

    for (final segment in _segments) {
      switch (segment) {
        case _TextSegment(:final text):
          widgets.add(Text(text, style: textStyle));
        case _InputSegment(:final index):
          // Ensure index is valid
          if (index < _correctBlanks.length) {
            final expectedAnswer = _correctBlanks[index];
            widgets.add(
              _BlankInput(
                controller: _controllers[inputIndex],
                expectedLength: expectedAnswer.length,
                disabled: widget.disabled,
              ),
            );
            inputIndex++;
          }
      }
    }

    return widgets;
  }
}

/// Inline text input for fill-in-the-blanks.
class _BlankInput extends StatelessWidget {
  final TextEditingController controller;
  final int expectedLength;
  final bool disabled;

  const _BlankInput({
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
