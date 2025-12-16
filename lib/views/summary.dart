import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/models/deck.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/widgets/karasu_scaffold.dart';
import 'package:karasu/widgets/markdown_with_audio.dart';

class Summary extends StatefulWidget {
  final String deckTitle;
  final List<CardModel> cards;
  final Map<String, AnswerModel> answers;

  const Summary(
      {super.key,
      required this.deckTitle,
      required this.cards,
      required this.answers});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  List<CardSummary> cardSummaries = [];
  int totalCards = 0;
  int totalCorrect = 0;

  List<String> answeredIDs = [];

  @override
  void initState() {
    super.initState();

    for (var c in widget.cards) {
      totalCards++;

      AnswerModel? answer = widget.answers[c.id];
      if (answer != null && answer.isCorrect) {
        totalCorrect++;
      }

      if (answer != null) {
        answeredIDs.add(answer.id);
      }

      cardSummaries.add(CardSummary(
        c: c,
        answeredID: answer?.id ?? '',
      ));
    }

    Future.delayed(Duration.zero, () {
      try {
        var client = GraphQLProvider.of(context).value;
        client.mutate(
          MutationOptions(
            document: gql("""
        mutation AnswerCards(\$answerIDs: [ID!]!) {
          answerCards(input: {answerIDs: \$answerIDs}) {
            answerIDs
          }
        }
      """),
            variables: {'answerIDs': answeredIDs},
          ),
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: Text(e.toString()),
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return KarasuScaffold(
      title: widget.deckTitle,
      body: ListView(children: [
        ScoreSummary(
          totalCards: totalCards,
          totalCorrect: totalCorrect,
        ),
        ...cardSummaries
      ]),
    );
  }
}

class ScoreSummary extends StatelessWidget {
  final int totalCards;
  final int totalCorrect;
  const ScoreSummary(
      {super.key, required this.totalCards, required this.totalCorrect});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$totalCorrect / $totalCards',
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
      ),
    );
  }
}

class CardSummary extends StatelessWidget {
  final CardModel c;
  final String answeredID;
  const CardSummary({super.key, required this.c, required this.answeredID});

  @override
  Widget build(BuildContext context) {
    Set answers = <AnswerDisplaySummary>{};
    bool isCorrect = true;
    AnswerModel correctAnswer = AnswerModel('', '', false);
    AnswerModel answeredAnswer = AnswerModel('', '', false);

    for (var a in c.answers) {
      if (a.isCorrect) {
        correctAnswer = a;
      }

      if (a.id == answeredID) {
        answeredAnswer = a;
      }
    }

    answers.add(AnswerDisplaySummary(
        key: Key(answeredAnswer.id), answer: answeredAnswer));
    if (answeredAnswer != correctAnswer) {
      isCorrect = false;
      answers.add(AnswerDisplaySummary(
          key: Key(correctAnswer.id), answer: correctAnswer));
    }

    final config = ConfigService().config;
    final brightness = Theme.of(context).brightness;
    final tileColor = isCorrect
        ? config.statusColors.getSuccessContainerColor(brightness)
        : config.statusColors.getErrorContainerColor(brightness);

    return SizedBox(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: MarkdownWithAudio(data: c.title),
              tileColor: tileColor,
            ),
            const Divider(),
            ...answers,
          ],
        ),
      ),
    );
  }
}

class AnswerDisplaySummary extends StatelessWidget {
  final AnswerModel answer;

  const AnswerDisplaySummary({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;
    final brightness = Theme.of(context).brightness;

    final iconColor = answer.isCorrect
        ? config.statusColors.getSuccessColor(brightness)
        : config.statusColors.getErrorColor(brightness);

    return ListTile(
      title: MarkdownBody(data: answer.text),
      leading: answer.isCorrect
          ? Icon(
              Icons.check,
              color: iconColor,
            )
          : Icon(
              Icons.close,
              color: iconColor,
            ),
    );
  }
}
