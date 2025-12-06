import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/models/deck.dart';
import 'package:karasu/models/create_card.dart';

class CreateCard extends StatefulWidget {
  CreateCard({super.key});
  final int numOfAnswers = 4;
  // TODO: Do not make them required to detect possible bugs if not initialized
  CreateCardModel cardModel = CreateCardModel("", "", [], "");
  late CreateTitle createTitle;
  late CreateExplanation createExplanation;
  List<CreateAnswerModel> answerModels = <CreateAnswerModel>[];
  List<CreateAnswer> answerWidgets = <CreateAnswer>[];

  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  void submitAndRestartForm() {
    widget.cardModel.answers = widget.answerModels;
    List<CreateAnswerModel> newAnswers = <CreateAnswerModel>[];
    for (var i = 0; i < widget.answerModels.length; i++) {
      var answerModel = CreateAnswerModel(
          widget.answerModels[i].text, widget.answerModels[i].isCorrect);
      newAnswers.add(answerModel);
    }
    CreateCardModel newCard = CreateCardModel(
      widget.cardModel.deckID,
      widget.cardModel.title,
      newAnswers,
      widget.cardModel.explanation,
    );
    submitCreateCardForm(context, newCard);
    restartForm();
  }

  void restartForm() {
    setState(() {
      widget.cardModel.title = "";
      widget.cardModel.explanation = "";
      widget.cardModel.answers.clear();
      newWidgets();
    });
  }

  void newWidgets() {
    List<CreateAnswerModel> newModels = <CreateAnswerModel>[];
    List<CreateAnswer> newWidgets = <CreateAnswer>[];
    for (var i = 0; i < widget.numOfAnswers; i++) {
      var answerModel = CreateAnswerModel("", false);
      var answerWidget = CreateAnswer(
        key: UniqueKey(),
        answerIndex: i,
        onChangedCallback: (text, isCorrect) => setState(() {
          answerModel.text = text;
          answerModel.isCorrect = isCorrect;
        }),
      );
      newModels.add(answerModel);

      newWidgets.add(answerWidget);
    }

    setState(() {
      widget.createTitle = CreateTitle(
          key: UniqueKey(),
          onChangedCallback: (text) => setState(() {
                widget.cardModel.title = text;
              }));

      widget.createExplanation = CreateExplanation(
          key: UniqueKey(),
          onChangedCallback: (text) => setState(() {
                widget.cardModel.explanation = text;
              }));

      widget.answerModels = newModels;
      widget.answerWidgets = newWidgets;
    });
  }

  submitCreateCardForm(BuildContext context, CreateCardModel cardModel) {
    Future.delayed(Duration.zero, () async {
      try {
        var client = GraphQLProvider.of(context).value;
        var result = await client.mutate(
          MutationOptions(
            document: gql("""
        mutation CreateDeckCard(\$card: CreateDeckCardInput!) {
          createDeckCard(input:\$card) {
            success
          }
        }
      """),
            variables: {'card': cardModel.toJson()},
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
  void initState() {
    super.initState();
    newWidgets();
  }

  @override
  Widget build(BuildContext context) {
    List<CreateAnswer> answerWidgets = widget.answerWidgets;
    CreateTitle titleWidget = widget.createTitle;
    CreateExplanation explanationWidget = widget.createExplanation;

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
            children: [
          Row(
            children: [
              DeckIDDropDown(
                deckIDCallback: (deckID) {
                  setState(() {
                    widget.cardModel.deckID = deckID ?? "";
                  });
                },
              )
            ],
          ),
          titleWidget,
          ...answerWidgets,
          explanationWidget,
          ElevatedButton(
            onPressed: () {
              submitAndRestartForm();
            },
            child: const Text('Submit'),
          )
        ].insertBetween(const SizedBox(height: 10.0))),
      ),
    );
  }
}

class DeckIDDropDown extends StatefulWidget {
  DeckIDDropDown({super.key, required this.deckIDCallback});
  final void Function(String? deckID) deckIDCallback;

  late List<DeckModel> decks;
  late String deckID;
  // Temporary solution. Should be replaced with an inactive widget while loading.
  List<DropdownMenuEntry<String>> deckOptions = [];

  final String query = """
    query GetPopularDecks(\$first: Int!) {
      popularDecks(first: \$first){
        edges {
          node {
            id
            title
            description
          }
          cursor
        }
        pageInfo {
          hasPreviousPage
          hasNextPage
          startCursor
          endCursor
        }
      }
    }
""";

  @override
  State<DeckIDDropDown> createState() => _DeckIDDropDownState();
}

class _DeckIDDropDownState extends State<DeckIDDropDown> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      var client = GraphQLProvider.of(context).value;
      final QueryResult result = await client.query(QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(widget.query),
        variables: const {
          'first': 50,
        },
      ));

      if (result.hasException) {
        return Text(result.exception.toString());
      }

      List? edges = result.data?['popularDecks']?['edges'];

      if (edges == null) {
        return const Text('No decks');
      }

      List<DeckModel> decks = [];

      for (var e in edges) {
        decks.add(DeckModel.fromJson(e['node']));
      }

      List<DropdownMenuEntry<String>> deckOptions = [];
      for (var d in decks) {
        deckOptions.add(DropdownMenuEntry(value: d.id, label: d.title));
      }

      setState(() {
        widget.decks = decks;
        widget.deckOptions = deckOptions;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> deckOptions = widget.deckOptions;

    return DropdownMenu<String>(
      enableFilter: true,
      leadingIcon: const Icon(Icons.search),
      label: const Text('Deck'),
      width: 300, // TODO: Use a sane default
      dropdownMenuEntries: deckOptions,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: widget.deckIDCallback,
    );
  }
}

class CreateTitle extends StatefulWidget {
  const CreateTitle({
    required this.key,
    required this.onChangedCallback,
  });

  final Key key;
  final Function(String text) onChangedCallback;

  @override
  State<CreateTitle> createState() => _CreateTitleState();
}

class _CreateTitleState extends State<CreateTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            key: widget.key,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Card Title',
            ),
            onChanged: (newValue) => {widget.onChangedCallback(newValue)},
          ),
        )
      ],
    );
  }
}

class CreateAnswer extends StatefulWidget {
  CreateAnswer(
      {required this.key,
      required this.answerIndex,
      required this.onChangedCallback});

  final Key? key;
  final int answerIndex;
  final Function(String text, bool isCorrect) onChangedCallback;

  String text = "";
  bool isCorrect = false;

  @override
  State<CreateAnswer> createState() => _CreateAnswerState();
}

class _CreateAnswerState extends State<CreateAnswer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        Expanded(
            child: TextFormField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Answer ${widget.answerIndex}',
          ),
          onChanged: (newValue) => setState(() {
            widget.text = newValue;
            widget.onChangedCallback(widget.text, widget.isCorrect);
          }),
        )),
        Checkbox(
          value: widget.isCorrect,
          onChanged: (newValue) {
            setState(() {
              widget.isCorrect = newValue!;
              widget.onChangedCallback(widget.text, widget.isCorrect);
            });
          },
        )
      ]),
    );
  }
}

class CreateExplanation extends StatefulWidget {
  const CreateExplanation({
    required this.key,
    required this.onChangedCallback,
  });

  final Key key;
  final Function(String text) onChangedCallback;

  @override
  State<CreateExplanation> createState() => _CreateExplanationState();
}

class _CreateExplanationState extends State<CreateExplanation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            key: widget.key,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Card Explanation',
            ),
            onChanged: (newValue) => {widget.onChangedCallback(newValue)},
          ),
        )
      ],
    );
  }
}

// Flutter does not fix vertical spacing between elements in a Column.
// Extremely wrong hack from: https://github.com/flutter/flutter/issues/16957#issuecomment-607645306
extension ExtendedWidgetList on List<Widget> {
  /// Insert [widget] between each member of this list
  List<Widget> insertBetween(Widget widget) {
    if (length > 1) {
      for (var i = length - 1; i > 0; i--) {
        insert(i, widget);
      }
    }

    return this;
  }
}
