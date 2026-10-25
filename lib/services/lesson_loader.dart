import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

/// A lesson with everything its screen shows: the body, the user's progress
/// in it, and the decks it embeds.
class LoadedLesson {
  final api.Lesson lesson;

  /// Deck ID to whether the user completed it. Empty when [stateError] is set.
  final Map<String, bool> deckStates;

  /// Why the lesson state couldn't be loaded, or null when it was.
  final Object? stateError;

  /// The embedded decks that loaded. A deck missing here is fetched again when
  /// it's shown.
  final Map<String, api.Deck> decks;

  /// Whether the user answered any card of the lesson, so it has cards to
  /// review.
  final bool hasAnsweredCard;

  const LoadedLesson({
    required this.lesson,
    required this.deckStates,
    required this.stateError,
    required this.decks,
    this.hasAnsweredCard = false,
  });
}

/// Loads a lesson in full. Throws when the lesson itself can't be loaded; a
/// failed lesson state or deck is left for the lesson screen to handle.
Future<LoadedLesson> loadLesson(
  LessonService service,
  String courseId,
  String lessonId,
) async {
  final logger = LoggerService.instance;

  final stateFuture = service
      .getLessonState(courseId, lessonId)
      .then<Object>((state) => state, onError: (Object e) => _Failed(e));
  final lesson = await service.getLesson(courseId, lessonId);

  final deckIds = service.extractDeckIds(lesson.body);
  final deckResults = await Future.wait(
    deckIds.map(
      (deckId) => service
          .getDeck(deckId)
          .then<api.Deck?>(
            (deck) => deck,
            onError: (Object e) {
              logger.e('loadLesson: failed to load deck $deckId', error: e);
              return null;
            },
          ),
    ),
  );
  final decks = {
    for (final deck in deckResults.whereType<api.Deck>()) deck.id: deck,
  };

  final state = await stateFuture;
  if (state is _Failed) {
    logger.e('loadLesson: failed to load lesson state', error: state.error);
    return LoadedLesson(
      lesson: lesson,
      deckStates: {},
      stateError: state.error,
      decks: decks,
    );
  }

  final lessonState =
      (state as api.GetLessonStateResponse).lessonState[lessonId];
  final hasAnsweredCard =
      lessonState?.decks.values.any(
        (deck) => deck.cards.values.any(
          (card) => card.correctAnswers + card.incorrectAnswers > 0,
        ),
      ) ??
      false;

  return LoadedLesson(
    lesson: lesson,
    deckStates: service.extractDeckStates(state, lessonId),
    stateError: null,
    decks: decks,
    hasAnsweredCard: hasAnsweredCard,
  );
}

class _Failed {
  final Object error;

  const _Failed(this.error);
}
