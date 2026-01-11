import 'package:toshokan_api/toshokan_api.dart';
import 'package:karasu/services/openapi_client.dart';
import 'package:karasu/services/logger_service.dart';

/// Service for managing lessons, courses, and progress using the Toshokan API.
///
/// Provides high-level methods for:
/// - Course operations (create, get, enroll)
/// - Lesson operations (create, list, get focused)
/// - Progress tracking (get state, submit answers)
/// - Deck operations (create, get, delete)
class LessonService {
  LessonService._();
  static final LessonService instance = LessonService._();

  final _logger = LoggerService.instance;
  OpenApiClient get _client => OpenApiClient.instance;

  // ===== Course Operations =====

  /// Create a new course with title and description.
  Future<Course> createCourse({
    required String title,
    required String description,
  }) async {
    try {
      final req = CreateCourseRequest(title: title, description: description);
      final res = await _client.courses.createCourse(createCourseRequest: req);
      _logger.i('Course created: ${res.data?.id}');
      return res.data!;
    } catch (e) {
      _logger.e('Create course failed', error: e);
      rethrow;
    }
  }

  /// Get course details by ID.
  Future<Course> getCourse(String courseId) async {
    try {
      final res = await _client.courses.getCourse(courseId: courseId);
      return res.data!;
    } catch (e) {
      _logger.e('Get course failed', error: e);
      rethrow;
    }
  }

  /// Enroll the authenticated user in a course.
  Future<bool> enrollCourse(String courseId) async {
    try {
      final res = await _client.courses.enrollCourse(courseId: courseId);
      final success = res.data?.success ?? true;
      _logger.i('Enrolled in course $courseId: $success');
      return success;
    } catch (e) {
      _logger.e('Enroll failed', error: e);
      rethrow;
    }
  }

  // ===== Lesson Operations =====

  /// Create a new lesson within a course.
  /// The body must reference at least one deck using: ![deck](uuid)
  Future<Lesson> createLesson({
    required String courseId,
    required int order,
    required String title,
    required String description,
    required String body,
  }) async {
    try {
      final req = CreateLessonRequest(
        order: order,
        title: title,
        description: description,
        body: body,
      );
      final res = await _client.lessons.createLesson(
        courseId: courseId,
        createLessonRequest: req,
      );
      _logger.i('Lesson created: ${res.data?.id}');
      return res.data!;
    } catch (e) {
      _logger.e('Create lesson failed', error: e);
      rethrow;
    }
  }

  /// Get paginated list of lessons for a course.
  /// Use [after]/[first] for forward pagination.
  /// Use [before]/[last] for backward pagination.
  Future<LessonsConnectionResponse> getLessons(
    String courseId, {
    String? after,
    String? before,
    int? first,
    int? last,
  }) async {
    try {
      final res = await _client.lessons.getLessons(
        courseId: courseId,
        after: after,
        before: before,
        first: first,
        last: last,
      );
      return res.data!;
    } catch (e) {
      _logger.e('Get lessons failed', error: e);
      rethrow;
    }
  }

  /// Get focused lessons with progress around the user's current lesson.
  /// Returns lessons with completion status and is_current flag.
  Future<LessonsWithProgressConnectionResponse> getFocusedLessons(
    String courseId,
  ) async {
    try {
      final res = await _client.lessons.getFocusedLessons(courseId: courseId);
      _logger.d('Focused lessons: ${res.data?.edges.length ?? 0} edges');
      return res.data!;
    } catch (e) {
      _logger.e('Get focused lessons failed', error: e);
      rethrow;
    }
  }

  // ===== Progress Operations =====

  /// Get the completion state of a lesson and its decks.
  /// Returns detailed state including card-level completion.
  Future<GetLessonStateResponse> getLessonState(
    String courseId,
    String lessonId,
  ) async {
    try {
      final res = await _client.progress.getLessonState(
        courseId: courseId,
        lessonId: lessonId,
      );
      return res.data!;
    } catch (e) {
      _logger.e('Get lesson state failed', error: e);
      rethrow;
    }
  }

  /// Extract deck completion states from the nested response.
  /// Returns a map of deckId → isCompleted.
  Map<String, bool> extractDeckStates(
    GetLessonStateResponse response,
    String lessonId,
  ) {
    final lessonState = response.lessonState[lessonId];
    if (lessonState == null) return {};
    return {
      for (final entry in lessonState.decks.entries)
        entry.key: entry.value.isCompleted,
    };
  }

  /// Submit answers for cards in a deck and update progress.
  /// [answers] is a list of {card_id, answer_id} pairs.
  Future<AnswerCardsResponse> answerCards({
    required String courseId,
    required String lessonId,
    required String deckId,
    required List<CardAnswer> answers,
  }) async {
    try {
      final res = await _client.progress.answerCards(
        courseId: courseId,
        lessonId: lessonId,
        deckId: deckId,
        cardAnswer: answers,
      );
      _logger.i('Submitted ${answers.length} answers for deck $deckId');
      return res.data!;
    } catch (e) {
      _logger.e('Answer cards failed', error: e);
      rethrow;
    }
  }

  // ===== Deck Operations =====

  /// Get deck details including all cards.
  Future<Deck> getDeck(String deckId) async {
    try {
      final res = await _client.decks.getDeck(id: deckId);
      return res.data!;
    } catch (e) {
      _logger.e('Get deck failed', error: e);
      rethrow;
    }
  }

  /// Create a new flashcard deck.
  Future<Deck> createDeck({
    required String title,
    required String description,
    required List<CardInput> cards,
    bool isPublic = false,
  }) async {
    try {
      final req = DeckInput(
        title: title,
        description: description,
        cards: cards,
        isPublic: isPublic,
      );
      final res = await _client.decks.createDeck(deckInput: req);
      _logger.i('Deck created: ${res.data?.id}');
      return res.data!;
    } catch (e) {
      _logger.e('Create deck failed', error: e);
      rethrow;
    }
  }

  /// Delete a deck.
  Future<void> deleteDeck(String deckId) async {
    try {
      await _client.decks.deleteDeck(id: deckId);
      _logger.i('Deck deleted: $deckId');
    } catch (e) {
      _logger.e('Delete deck failed', error: e);
      rethrow;
    }
  }

  // ===== Helper Methods =====

  /// Extract deck IDs from lesson body markdown.
  /// Matches pattern: ![deck](uuid)
  List<String> extractDeckIds(String body) {
    final pattern = RegExp(
      r'!\[deck\]\(([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})\)',
    );
    final matches = pattern.allMatches(body);
    return matches.map((m) => m.group(1)!).toList();
  }

  /// Check if a lesson is completed from the response.
  bool isLessonComplete(GetLessonStateResponse response, String lessonId) {
    return response.lessonState[lessonId]?.isCompleted ?? false;
  }

  /// Get count of completed cards in a deck state.
  int getCompletedCardsCount(DeckState deckState) {
    return deckState.cards.values.where((c) => c.isCompleted).length;
  }

  /// Get total cards count in a deck state.
  int getTotalCardsCount(DeckState deckState) {
    return deckState.cards.length;
  }
}
