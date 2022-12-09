import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/models/deck.dart';
import 'package:karasu/views/round.dart';
import 'package:karasu/widgets/loading.dart';

class DeckDisplay extends StatelessWidget {
  final DeckModel deck;

  const DeckDisplay({super.key, required this.deck});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      splashColor: Colors.amber,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RoundView(deck: deck),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.book),
              title: Text(deck.title),
              subtitle: Text(deck.description),
            ),
          ],
        ),
      ),
    ));
  }
}

class PopularDecksDisplay extends StatefulWidget {
  const PopularDecksDisplay({super.key});

  final String query = """
    query GetPopularDecks(\$first: Int!) {
      popularDecks(first: \$first){
        edges {
          node {
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
  State<PopularDecksDisplay> createState() => _PopularDecksDisplayState();
}

class _PopularDecksDisplayState extends State<PopularDecksDisplay> {
  final popularDecksDisplayList = <DeckDisplay>[];

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(widget.query),
        variables: const {
          'first': 50,
        },
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const LoadingWidget();
        }

        List? edges = result.data?['popularDecks']?['edges'];

        if (edges == null) {
          return const Text('No decks');
        }

        List decks = [];

        for (var e in edges) {
          if (e['node']?['cards'] != null) {
            decks.add(e);
          }
        }

        return ListView.builder(
            itemCount: decks.length,
            itemBuilder: (context, index) {
              final d = decks[index]['node'];
              return DeckDisplay(
                  deck: DeckModel(d['id'], d['title'], d['description']));
            });
      },
    );
  }
}
