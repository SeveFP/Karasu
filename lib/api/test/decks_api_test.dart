import 'package:test/test.dart';
import 'package:toshokan_api/toshokan_api.dart';


/// tests for DecksApi
void main() {
  final instance = ToshokanApi().getDecksApi();

  group(DecksApi, () {
    // Create a new deck
    //
    // Create a new flashcard deck
    //
    //Future<Deck> createDeck(DeckInput deckInput) async
    test('test createDeck', () async {
      // TODO
    });

    // Delete a deck
    //
    // Delete an existing deck
    //
    //Future deleteDeck(String id) async
    test('test deleteDeck', () async {
      // TODO
    });

    // Get deck details
    //
    // Retrieve details of a specific deck including all cards
    //
    //Future<Deck> getDeck(String id) async
    test('test getDeck', () async {
      // TODO
    });

  });
}
