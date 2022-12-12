import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:karasu/models/deck.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/views/summary.dart';
import 'package:karasu/widgets/karasuScaffold.dart';
import 'package:karasu/widgets/loading.dart';

class RoundView extends StatefulWidget {
  final DeckModel deck;

  const RoundView({super.key, required this.deck});

  final String query = """
    query GetDeck(\$id: ID!){
      deck(id: \$id){
        id
        title
        description
        cards {
          id
          title
          answers {
            id
            text
            isCorrect
          }
        }
      }
    }
  """;

  @override
  State<RoundView> createState() => _RoundViewState();
}

class _RoundViewState extends State<RoundView> {
  List<CardModel> cards = [];
  Map<String, String> answeredIDs = {};

  var currentCardIndex = 0;
  bool inProgress = true;

  void _handleTap(String cardID, String answerID) {
    setState(() {
      answeredIDs[cardID] = answerID;

      currentCardIndex++;
      if (currentCardIndex >= cards.length) {
        inProgress = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(widget.query),
        variables: {
          'id': widget.deck.id,
        },
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (cards.isEmpty) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const LoadingWidget();
          }

          List? cardResults = result.data?['deck']?['cards'];
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
        }

        return inProgress
            ? buildCardView(
                widget.deck.title, cards[currentCardIndex], _handleTap)
            : buildSummary(widget.deck.title, Summary(cards, answeredIDs));
      },
    );
  }
}

Widget buildCardView(String title, CardModel c,
    Function(String cardID, String answerID) onChanged) {
  return KarasuScaffold(
    title: title,
    body: CardDisplay(
      key: Key(c.id),
      c: c,
      onChanged: onChanged,
    ),
  );
}

class CardDisplay extends StatefulWidget {
  final CardModel c;
  final Function(String cardID, String answerID) onChanged;

  const CardDisplay({super.key, required this.c, required this.onChanged});

  @override
  State<CardDisplay> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  String _selectedAnswerID = '';

  void _handleTap(String answerID) {
    setState(() {
      // Allow choosing an answer just once.
      if (_selectedAnswerID != '') {
        return;
      }

      _selectedAnswerID = answerID.toString();

      // Move onto the next card with a bit of delay
      // so the user can confirm visually which answer they picked.
      Timer(const Duration(milliseconds: 400), () {
        widget.onChanged(widget.c.id, _selectedAnswerID);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List answers = <AnswerDisplay>[];

    for (var a in widget.c.answers) {
      answers.add(AnswerDisplay(
        answer: a,
        active: _selectedAnswerID == a.id ? true : false,
        disabled: _selectedAnswerID.isNotEmpty && _selectedAnswerID != a.id
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
  final ValueChanged<String> onChanged;

  const AnswerDisplay({
    super.key,
    this.active = false,
    required this.onChanged,
    required this.answer,
    required this.disabled,
  });

  void _handleTap() {
    onChanged(answer.id);
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
