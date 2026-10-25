import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karasu/api/lib/toshokan_api.dart' as api;
import 'package:karasu/router.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/widgets/card_display.dart';
import 'package:karasu/widgets/markdown_with_audio.dart';

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

  final void Function(bool isCorrect) playResultSound;

  const LessonDeckPlayer({
    super.key,
    required this.deck,
    required this.onCompleted,
    this.courseId,
    this.lessonId,
    this.initiallyCompleted = false,
    required this.playResultSound,
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
    // Two quick taps can both arrive before the card rebuilds as answered.
    if (_answers.containsKey(cardID)) return;

    setState(() {
      _answers[cardID] = answer;
    });

    // Submit answer to backend (fire and forget)
    _submitAnswer(cardID, answer);

    // Play correct/incorrect sound
    widget.playResultSound(answer.isCorrect == true);

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
      return Text(AppLocalizations.of(context)!.noCardsAvailable);
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
              subtitle: MarkdownWithAudio(data: widget.deck.description),
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
                    AppLocalizations.of(context)!.correctAnswers(correctCount),
                    style: TextStyle(
                      color: successColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.incorrectAnswers(incorrectCount),
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
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _restart,
                      icon: const Icon(Icons.refresh),
                      label: Text(AppLocalizations.of(context)!.restartButton),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRouter.review,
                        arguments: {'deckId': widget.deck.id},
                      ),
                      icon: const Icon(Icons.style_rounded),
                      label: Text(AppLocalizations.of(context)!.reviewDeck),
                    ),
                  ),
                ],
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
        leading: Icon(
          Icons.library_books_rounded,
          color: colorScheme.onPrimaryContainer,
        ),
        title: Text(
          widget.deck.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        subtitle: MarkdownWithAudio(data: widget.deck.description),
      ),
    );

    return Column(
      children: [
        deckHeader,
        CardDisplay(
          card: card,
          counter: '${_current + 1}/${_cards.length}',
          submitting: _submitting,
          selected: _answers[card.id],
          onAnswer: (answer) => _handleTap(card.id, answer),
        ),
      ],
    );
  }
}
