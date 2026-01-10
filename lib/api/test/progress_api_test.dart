import 'package:test/test.dart';
import 'package:toshokan_api/toshokan_api.dart';


/// tests for ProgressApi
void main() {
  final instance = ToshokanApi().getProgressApi();

  group(ProgressApi, () {
    // Submit answers for cards
    //
    // Submit user's answers for cards in a deck and update progress
    //
    //Future<AnswerCardsResponse> answerCards(String courseId, String lessonId, String deckId, List<CardAnswer> cardAnswer) async
    test('test answerCards', () async {
      // TODO
    });

    // Get lesson state
    //
    // Retrieve the completion state of a lesson and its decks
    //
    //Future<LessonStateResponse> getLessonState(String courseId, String lessonId) async
    test('test getLessonState', () async {
      // TODO
    });

  });
}
