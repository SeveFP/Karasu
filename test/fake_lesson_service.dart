import 'dart:async';

import 'package:karasu/services/lesson_service.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

/// A recorded call to [FakeLessonService.getReview].
class GetReviewCall {
  final int maxCards;
  final String? deckId;
  final String? lessonId;
  final String? courseId;

  const GetReviewCall(
    this.maxCards, {
    this.deckId,
    this.lessonId,
    this.courseId,
  });

  @override
  bool operator ==(Object other) =>
      other is GetReviewCall &&
      other.maxCards == maxCards &&
      other.deckId == deckId &&
      other.lessonId == lessonId &&
      other.courseId == courseId;

  @override
  int get hashCode => Object.hash(maxCards, deckId, lessonId, courseId);

  @override
  String toString() =>
      'GetReviewCall($maxCards, deckId: $deckId, lessonId: $lessonId, courseId: $courseId)';
}

/// A recorded call to [FakeLessonService.getLessons].
class GetLessonsCall {
  final String courseId;
  final String? after;
  final String? before;
  final int? first;
  final int? last;

  const GetLessonsCall(
    this.courseId, {
    this.after,
    this.before,
    this.first,
    this.last,
  });

  @override
  bool operator ==(Object other) =>
      other is GetLessonsCall &&
      other.courseId == courseId &&
      other.after == after &&
      other.before == before &&
      other.first == first &&
      other.last == last;

  @override
  int get hashCode => Object.hash(courseId, after, before, first, last);

  @override
  String toString() =>
      'GetLessonsCall($courseId, after: $after, before: $before, first: $first, last: $last)';
}

/// Fake lesson service: answers each call with the next preset response,
/// waiting for it when it's a [Future] and throwing it when it's an
/// [Exception]. The lesson state is empty, fails when
/// [lessonStateError] is set, and waits for [lessonStateGate] when set.
/// Decks come from [decks] by ID; a missing one fails. [lessonState], when
/// set, is returned as the lesson state. Review rounds answer with the next
/// preset in [reviewResponses], like [lessonsResponses]; submitted review
/// answers fail when [submitReviewError] is set.
class FakeLessonService implements LessonService {
  final List<Object> lessonsResponses;
  final List<Object> lessonResponses;
  final Exception? lessonStateError;
  final Completer<void>? lessonStateGate;
  final Map<String, api.Deck> decks;
  final api.GetLessonStateResponse? lessonState;
  final List<Object> reviewResponses;
  final Exception? submitReviewError;
  final List<GetLessonsCall> getLessonsCalls = [];
  final List<GetReviewCall> getReviewCalls = [];
  final List<List<String>> submitReviewAnswersCalls = [];
  final List<String> getLessonCalls = [];
  final List<String> getDeckCalls = [];

  FakeLessonService({
    this.lessonsResponses = const [],
    this.lessonResponses = const [],
    this.lessonStateError,
    this.lessonStateGate,
    this.decks = const {},
    this.lessonState,
    this.reviewResponses = const [],
    this.submitReviewError,
  });

  @override
  Future<api.BodylessLessonsWithProgressConnectionResponse> getLessons(
    String courseId, {
    String? after,
    String? before,
    int? first,
    int? last,
  }) async {
    getLessonsCalls.add(
      GetLessonsCall(
        courseId,
        after: after,
        before: before,
        first: first,
        last: last,
      ),
    );
    final preset = lessonsResponses[getLessonsCalls.length - 1];
    final response = preset is Future ? await preset : preset;
    if (response is Exception) throw response;
    return response as api.BodylessLessonsWithProgressConnectionResponse;
  }

  @override
  Future<api.Lesson> getLesson(String courseId, String lessonId) async {
    getLessonCalls.add(lessonId);
    final response = lessonResponses[getLessonCalls.length - 1];
    if (response is Exception) throw response;
    return response as api.Lesson;
  }

  @override
  Future<api.GetLessonStateResponse> getLessonState(
    String courseId,
    String lessonId,
  ) async {
    await lessonStateGate?.future;
    if (lessonStateError != null) throw lessonStateError!;
    return lessonState ?? api.GetLessonStateResponse(lessonState: {});
  }

  @override
  Future<api.Deck> getDeck(String deckId) async {
    getDeckCalls.add(deckId);
    final deck = decks[deckId];
    if (deck == null) throw Exception('deck $deckId not found');
    return deck;
  }

  @override
  Future<List<api.Card>> getReview({
    required int maxCards,
    String? deckId,
    String? lessonId,
    String? courseId,
  }) async {
    getReviewCalls.add(
      GetReviewCall(
        maxCards,
        deckId: deckId,
        lessonId: lessonId,
        courseId: courseId,
      ),
    );
    final response = reviewResponses[getReviewCalls.length - 1];
    if (response is Exception) throw response;
    return response as List<api.Card>;
  }

  @override
  Future<void> submitReviewAnswers(List<String> answerIds) async {
    submitReviewAnswersCalls.add(answerIds);
    if (submitReviewError != null) throw submitReviewError!;
  }

  @override
  List<String> extractDeckIds(String body) {
    return LessonService.instance.extractDeckIds(body);
  }

  @override
  Map<String, bool> extractDeckStates(
    api.GetLessonStateResponse response,
    String lessonId,
  ) {
    return LessonService.instance.extractDeckStates(response, lessonId);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
