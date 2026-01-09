import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karasu/api/lib/toshokan_api.dart' as api;
import 'package:karasu/services/config_service.dart';
import 'package:karasu/widgets/markdown_with_audio.dart';

/// Lightweight deck runner for lesson embeds (no network calls).
class LessonDeckPlayer extends StatefulWidget {
  final api.Deck deck;

  const LessonDeckPlayer({super.key, required this.deck});

  @override
  State<LessonDeckPlayer> createState() => _LessonDeckPlayerState();
}

class _LessonDeckPlayerState extends State<LessonDeckPlayer> {
  late List<api.Card> _cards;
  final Map<String, api.Answer> _answers = {};
  int _current = 0;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _cards = widget.deck.cards;
  }

  void _handleTap(String cardID, api.Answer answer) {
    setState(() {
      _answers[cardID] = answer;
      _current++;
      if (_current >= _cards.length) {
        _completed = true;
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

      final correctCount = _answers.values.where((a) => a.isCorrect == true).length;
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
            trailing: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '${_current + 1}/${_cards.length}',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: MarkdownWithAudio(data: card.title),
          // ),
          const Divider(height: 1),
          ...card.possibleAnswers.map((a) => _AnswerDisplay(
                answer: a,
                disabled: _answers.containsKey(card.id),
                active: _answers[card.id]?.id == a.id,
                onChanged: (ans) {
                  // Allow choosing once per card
                  if (_answers.containsKey(card.id)) return;
                  _handleTap(card.id, ans);
                },
              )),
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
        trailing: Icon(
          Icons.circle,
          color: active ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
