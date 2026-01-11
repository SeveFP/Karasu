import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karasu/api/lib/toshokan_api.dart' as api;
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/widgets/markdown_with_audio.dart';

/// Lightweight deck runner for lesson embeds.
/// Submits answers to the backend when courseId and lessonId are provided.
class LessonDeckPlayer extends StatefulWidget {
  final api.Deck deck;

  /// Course ID for submitting answers. Optional for preview mode.
  final String? courseId;

  /// Lesson ID for submitting answers. Optional for preview mode.
  final String? lessonId;

  const LessonDeckPlayer({
    super.key,
    required this.deck,
    this.courseId,
    this.lessonId,
  });

  @override
  State<LessonDeckPlayer> createState() => _LessonDeckPlayerState();
}

class _LessonDeckPlayerState extends State<LessonDeckPlayer> {
  late List<api.Card> _cards;
  final Map<String, api.Answer> _answers = {};
  int _current = 0;
  bool _completed = false;
  bool _submitting = false;
  final _logger = LoggerService.instance;

  @override
  void initState() {
    super.initState();
    _cards = widget.deck.cards;
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

      // TODO: This info is not currently returned by the backend
      // It should be fetched via the getLessonState endpoint after the round
      _logger.i(
        'Answer submitted: deckCompleted=${response.deckCompleted}, '
        'lessonCompleted=${response.lessonCompleted}',
      );
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

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            title: MarkdownWithAudio(data: card.title),
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
          ),
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
