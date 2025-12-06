import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:karasu/models/deck.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/views/summary.dart';
import 'package:karasu/widgets/karasuScaffold.dart';
import 'package:karasu/widgets/loading.dart';

class RoundView extends StatefulWidget {
  final DeckModel deck;

  const RoundView({super.key, required this.deck});

  final String query = """
    query Cards(\$deckID: ID!, \$maxCards: Int!) {
      cards(input: {deckID: \$deckID, maxCards: \$maxCards}) {
        id
        title
        answers {
          id
          text
          isCorrect
        }
        explanation
      }
    }
  """;

  @override
  State<RoundView> createState() => _RoundViewState();
}

class _RoundViewState extends State<RoundView> {
  List<CardModel> cards = [];
  Map<String, AnswerModel> answers = {};

  var currentCardIndex = 0;
  bool inProgress = true;

  void _handleTap(String cardID, AnswerModel answer) {
    setState(() {
      answers[cardID] = answer;

      currentCardIndex++;
      if (currentCardIndex >= cards.length) {
        inProgress = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      var client = GraphQLProvider.of(context).value;
      final QueryResult result = await client.query(QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(widget.query),
        variables: {
          'deckID': widget.deck.id,
          'maxCards': 10,
        },
      ));

      if (result.hasException) {
        throw Exception(result.exception!.linkException!.originalException);
      }

      List? cardResults = result.data?['cards'];
      if (cardResults == null) {
        cards.add(CardModel('id', 'No cards!', []));
        return buildCardView(
            widget.deck.title, cards[currentCardIndex], _handleTap);
      }

      for (var c in cardResults) {
        var answers = <AnswerModel>[];
        List? possibleAnswers = c['answers'];
        if (possibleAnswers == null) {
          continue;
        }

        for (var a in possibleAnswers) {
          answers.add(AnswerModel(a['id'], a['text'], a['isCorrect']));
        }

        cards.add(CardModel(c['id'], c['title'], answers));
      }

      setState(() {
        cards = cards;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return const LoadingWidget();
    }

    return inProgress
        ? buildCardView(widget.deck.title, cards[currentCardIndex], _handleTap)
        : Summary(deckTitle: widget.deck.title, cards: cards, answers: answers);
  }
}

Widget buildCardView(String title, CardModel c,
    Function(String cardID, AnswerModel answer) onChanged) {
  return KarasuScaffold(
    title: title,
    body: SingleChildScrollView(
      child: CardDisplay(
        key: Key(c.id),
        c: c,
        onChanged: onChanged,
      ),
    ),
  );
}

class CardDisplay extends StatefulWidget {
  final CardModel c;
  final Function(String cardID, AnswerModel answer) onChanged;

  const CardDisplay({super.key, required this.c, required this.onChanged});

  @override
  State<CardDisplay> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  AnswerModel? _selectedAnswer;

  void _handleTap(AnswerModel answer) {
    setState(() {
      // Allow choosing an answer just once.
      if (_selectedAnswer != null) {
        return;
      }

      _selectedAnswer = answer;

      // Move onto the next card with a bit of delay
      // so the user can confirm visually which answer they picked.
      Timer(const Duration(milliseconds: 400), () {
        widget.onChanged(widget.c.id, _selectedAnswer!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List answers = <AnswerDisplay>[];

    for (var a in widget.c.answers) {
      answers.add(AnswerDisplay(
        answer: a,
        active: _selectedAnswer?.id == a.id ? true : false,
        disabled: _selectedAnswer != null && _selectedAnswer?.id != a.id
            ? true
            : false,
        onChanged: _handleTap,
      ));
    }

    return SizedBox(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: MarkdownBody(data: widget.c.title),
              leading: Icon(
                Icons.contact_support_rounded,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
            ...answers,
          ],
        ),
      ),
    );
  }
}

class AnswerDisplay extends StatelessWidget {
  final AnswerModel answer;
  final bool active;
  final bool disabled;
  final ValueChanged<AnswerModel> onChanged;

  const AnswerDisplay({
    super.key,
    this.active = false,
    required this.onChanged,
    required this.answer,
    required this.disabled,
  });

  void _handleTap() {
    onChanged(answer);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: !disabled ? 1.0 : 0.2,
        duration: const Duration(milliseconds: 1),
        child: ListTile(
          onTap: _handleTap,
          title: MarkdownBody(data: answer.text),
          trailing: active
              ? const Icon(
                  Icons.circle,
                  color: Colors.blue,
                )
              : const Icon(
                  Icons.circle,
                  color: Colors.grey,
                ),
        ));
  }
}
