import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/models/deck.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/models/create_card.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({super.key});

  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  static const int numOfAnswers = 4;
  CreateCardModel cardModel = CreateCardModel("", "", [], "");
  late CreateTitle createTitle;
  late CreateExplanation createExplanation;
  List<CreateAnswerModel> answerModels = <CreateAnswerModel>[];
  List<CreateAnswer> answerWidgets = <CreateAnswer>[];

  void submitAndRestartForm() {
    cardModel.answers = answerModels;
    List<CreateAnswerModel> newAnswers = <CreateAnswerModel>[];
    for (var i = 0; i < answerModels.length; i++) {
      var answerModel = CreateAnswerModel(
        answerModels[i].text,
        answerModels[i].isCorrect,
      );
      newAnswers.add(answerModel);
    }
    CreateCardModel newCard = CreateCardModel(
      cardModel.deckID,
      cardModel.title,
      newAnswers,
      cardModel.explanation,
    );
    _submitCreateCardForm(newCard);
    restartForm();
  }

  void restartForm() {
    setState(() {
      cardModel.title = "";
      cardModel.explanation = "";
      cardModel.answers.clear();
      newWidgets();
    });
  }

  void newWidgets() {
    List<CreateAnswerModel> newModels = <CreateAnswerModel>[];
    List<CreateAnswer> newCreateWidgets = <CreateAnswer>[];
    for (var i = 0; i < numOfAnswers; i++) {
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

      newCreateWidgets.add(answerWidget);
    }

    setState(() {
      createTitle = CreateTitle(
        key: UniqueKey(),
        onChangedCallback: (text) => setState(() {
          cardModel.title = text;
        }),
      );

      createExplanation = CreateExplanation(
        key: UniqueKey(),
        onChangedCallback: (text) => setState(() {
          cardModel.explanation = text;
        }),
      );

      answerModels = newModels;
      answerWidgets = newCreateWidgets;
    });
  }

  Future<void> _submitCreateCardForm(CreateCardModel cardModel) async {
    final client = GraphQLProvider.of(context).value;
    try {
      await client.mutate(
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
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.errorTitle),
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    newWidgets();
  }

  @override
  Widget build(BuildContext context) {
    List<CreateAnswer> currentAnswerWidgets = answerWidgets;
    CreateTitle titleWidget = createTitle;
    CreateExplanation explanationWidget = createExplanation;

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
                      cardModel.deckID = deckID ?? "";
                    });
                  },
                ),
              ],
            ),
            titleWidget,
            ...currentAnswerWidgets,
            explanationWidget,
            ElevatedButton(
              onPressed: () {
                submitAndRestartForm();
              },
              child: Text(AppLocalizations.of(context)!.submitButton),
            ),
          ].insertBetween(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}

class DeckIDDropDown extends StatefulWidget {
  const DeckIDDropDown({super.key, required this.deckIDCallback});
  final void Function(String? deckID) deckIDCallback;

  static const String query = """
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
  List<DropdownMenuEntry<String>> _deckOptions = [];

  @override
  void initState() {
    super.initState();
    _loadDecks();
  }

  Future<void> _loadDecks() async {
    final client = GraphQLProvider.of(context).value;
    final QueryResult result = await client.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(DeckIDDropDown.query),
        variables: const {'first': 50},
      ),
    );

    if (!mounted) return;

    if (result.hasException) {
      return;
    }

    List? edges = result.data?['popularDecks']?['edges'];

    if (edges == null) {
      return;
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
      _deckOptions = deckOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      enableFilter: true,
      leadingIcon: const Icon(Icons.search),
      label: Text(AppLocalizations.of(context)!.deckLabel),
      width: 300, // TODO: Use a sane default
      dropdownMenuEntries: _deckOptions,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: widget.deckIDCallback,
    );
  }
}

class CreateTitle extends StatefulWidget {
  const CreateTitle({super.key, required this.onChangedCallback});

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
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Card Title',
            ),
            onChanged: (newValue) => {widget.onChangedCallback(newValue)},
          ),
        ),
      ],
    );
  }
}

class CreateAnswer extends StatefulWidget {
  const CreateAnswer({
    super.key,
    required this.answerIndex,
    required this.onChangedCallback,
  });

  final int answerIndex;
  final Function(String text, bool isCorrect) onChangedCallback;

  @override
  State<CreateAnswer> createState() => _CreateAnswerState();
}

class _CreateAnswerState extends State<CreateAnswer> {
  String _text = "";
  bool _isCorrect = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Answer ${widget.answerIndex}',
              ),
              onChanged: (newValue) => setState(() {
                _text = newValue;
                widget.onChangedCallback(_text, _isCorrect);
              }),
            ),
          ),
          Checkbox(
            value: _isCorrect,
            onChanged: (newValue) {
              setState(() {
                _isCorrect = newValue!;
                widget.onChangedCallback(_text, _isCorrect);
              });
            },
          ),
        ],
      ),
    );
  }
}

class CreateExplanation extends StatefulWidget {
  const CreateExplanation({super.key, required this.onChangedCallback});

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
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Card Explanation',
            ),
            onChanged: (newValue) => {widget.onChangedCallback(newValue)},
          ),
        ),
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
