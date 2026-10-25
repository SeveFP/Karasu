import 'dart:async';

import 'package:karasu/services/lesson_service.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

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
/// Decks come from [decks] by ID; a missing one fails.
class FakeLessonService implements LessonService {
  final List<Object> lessonsResponses;
  final List<Object> lessonResponses;
  final Exception? lessonStateError;
  final Completer<void>? lessonStateGate;
  final Map<String, api.Deck> decks;
  final List<GetLessonsCall> getLessonsCalls = [];
  final List<String> getLessonCalls = [];
  final List<String> getDeckCalls = [];

  FakeLessonService({
    this.lessonsResponses = const [],
    this.lessonResponses = const [],
    this.lessonStateError,
    this.lessonStateGate,
    this.decks = const {},
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
    return api.GetLessonStateResponse(lessonState: {});
  }

  @override
  Future<api.Deck> getDeck(String deckId) async {
    getDeckCalls.add(deckId);
    final deck = decks[deckId];
    if (deck == null) throw Exception('deck $deckId not found');
    return deck;
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
    return {};
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
