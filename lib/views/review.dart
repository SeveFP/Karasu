import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/services/result_sound.dart';
import 'package:karasu/widgets/card_display.dart';
import 'package:karasu/widgets/markdown_with_audio.dart';
import 'package:karasu/widgets/shell_scaffold.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

/// Review round over cards the user already answered: from one deck, lesson
/// or course, or from all of them when no scope is given. Cards come one at a
/// time, and each answer is sent as soon as it's given.
class ReviewView extends StatefulWidget {
  final String? deckId;
  final String? lessonId;
  final String? courseId;
  final LessonService service;
  final ResultSound? resultSound;

  ReviewView({
    super.key,
    this.deckId,
    this.lessonId,
    this.courseId,
    LessonService? service,
    this.resultSound,
  }) : service = service ?? LessonService.instance;

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  final _logger = LoggerService.instance;
  late final ResultSound _resultSound = widget.resultSound ?? ResultSound();
  final List<api.Card> _cards = [];
  final Map<String, api.Answer> _answers = {};
  int _current = 0;
  bool _isLoading = true;
  String? _error;

  bool get _isFinished => _cards.isNotEmpty && _current >= _cards.length;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    if (widget.resultSound == null) {
      _resultSound.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final cards = await widget.service.getReview(
        maxCards: ConfigService().config.defaultMaxCards,
        deckId: widget.deckId,
        lessonId: widget.lessonId,
        courseId: widget.courseId,
      );

      if (!mounted) return;

      setState(() {
        _cards
          ..clear()
          ..addAll(
            // Shuffle the answers so the correct one isn't always in the
            // same position.
            cards
                .where(_canBeAnswered)
                .map(
                  (card) => card.copyWith(
                    possibleAnswers: [...card.possibleAnswers]..shuffle(),
                  ),
                ),
          );
        _answers.clear();
        _current = 0;
        _isLoading = false;
      });
    } catch (e) {
      _logger.e('Load review failed', error: e);

      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  // A card without answers, or a fill-in-the-blanks card without both its
  // correct and its wrong answer, can't be answered and would stop the round.
  bool _canBeAnswered(api.Card card) {
    final hasCorrect = card.possibleAnswers.any((a) => a.isCorrect == true);
    if (card.kind == api.CardKindEnum.fillInTheBlanks) {
      final hasWrong = card.possibleAnswers.any((a) => a.isCorrect != true);
      return hasCorrect && hasWrong;
    }
    return card.possibleAnswers.isNotEmpty;
  }

  void _answer(api.Card card, api.Answer answer) {
    // Two quick taps can both arrive before the card rebuilds as answered.
    if (_answers.containsKey(card.id)) return;

    setState(() => _answers[card.id] = answer);

    _resultSound.play(answer.isCorrect == true);
    _submit(answer);

    // Move to the next card with a short delay, so the chosen answer shows.
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() => _current++);
      }
    });
  }

  Future<void> _submit(api.Answer answer) async {
    try {
      await widget.service.submitReviewAnswers([answer.id]);
    } catch (e) {
      // The round goes on; the answer is still shown in the summary.
      _logger.e('Failed to submit review answer', error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      title: AppLocalizations.of(context)!.reviewTitle,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.failedToLoadReview(_error ?? ''),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _load,
              child: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      );
    }

    if (_cards.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.style_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(97),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.nothingToReview,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.nothingToReviewDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (_isFinished) {
      return _buildSummary();
    }

    final card = _cards[_current];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: CardDisplay(
        key: ValueKey(card.id),
        card: card,
        counter: '${_current + 1}/${_cards.length}',
        selected: _answers[card.id],
        onAnswer: (answer) => _answer(card, answer),
      ),
    );
  }

  Widget _buildSummary() {
    final correct = _cards
        .where((card) => _answers[card.id]?.isCorrect == true)
        .length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.scoreSummary(correct, _cards.length),
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
          ),
        ),
        const SizedBox(height: 16),
        ..._cards.map(
          (card) => _ReviewedCard(card: card, chosen: _answers[card.id]),
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton.icon(
            onPressed: _load,
            icon: const Icon(Icons.refresh),
            label: Text(AppLocalizations.of(context)!.reviewAgain),
          ),
        ),
      ],
    );
  }
}

/// A card in the review summary: its question, the chosen answer and, when
/// that was wrong, the correct one. A fill-in-the-blanks card shows its
/// blanks as gaps and lists the correct blanks, since what was typed isn't
/// kept.
class _ReviewedCard extends StatelessWidget {
  static final _blank = RegExp(r'!\[input\]\(\d+\)');

  final api.Card card;
  final api.Answer? chosen;

  const _ReviewedCard({required this.card, required this.chosen});

  @override
  Widget build(BuildContext context) {
    final correctAnswer = card.possibleAnswers
        .where((answer) => answer.isCorrect == true)
        .firstOrNull;
    final isCorrect = chosen?.isCorrect == true;
    final isFillInTheBlanks = card.kind == api.CardKindEnum.fillInTheBlanks;
    final title = isFillInTheBlanks
        ? card.title.replaceAll(_blank, r'\_\_\_')
        : card.title;

    final config = ConfigService().config;
    final brightness = Theme.of(context).brightness;
    final tileColor = isCorrect
        ? config.statusColors.getSuccessContainerColor(brightness)
        : config.statusColors.getErrorContainerColor(brightness);

    return Card(
      child: Column(
        children: [
          ListTile(
            title: MarkdownWithAudio(data: title),
            tileColor: tileColor,
          ),
          const Divider(),
          if (isFillInTheBlanks && correctAnswer != null)
            _ReviewedAnswer(
              answer: correctAnswer,
              text: correctAnswer.text.split(';').join(', '),
            ),
          if (!isFillInTheBlanks && chosen != null)
            _ReviewedAnswer(answer: chosen!),
          if (!isFillInTheBlanks && !isCorrect && correctAnswer != null)
            _ReviewedAnswer(answer: correctAnswer),
        ],
      ),
    );
  }
}

class _ReviewedAnswer extends StatelessWidget {
  final api.Answer answer;

  /// Shown instead of the answer's own text.
  final String? text;

  const _ReviewedAnswer({required this.answer, this.text});

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;
    final brightness = Theme.of(context).brightness;
    final isCorrect = answer.isCorrect == true;
    final iconColor = isCorrect
        ? config.statusColors.getSuccessColor(brightness)
        : config.statusColors.getErrorColor(brightness);

    return ListTile(
      title: MarkdownBody(data: text ?? answer.text),
      leading: Icon(isCorrect ? Icons.check : Icons.close, color: iconColor),
    );
  }
}
