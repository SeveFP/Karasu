import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_loader.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

import '../config_bundle.dart';
import '../fake_lesson_service.dart';

const courseId = 'fb9ffe2c-ad66-4766-9b7b-46fd5d9acd72';
const lessonId = '334ddbf8-1acc-405b-86d8-49f0d1ca636c';
const deckA = 'aaaaaaaa-0000-0000-0000-000000000000';
const deckB = 'bbbbbbbb-0000-0000-0000-000000000000';

final lesson = api.Lesson(
  id: lessonId,
  courseId: courseId,
  order: 1,
  title: 'Introduction',
  description: 'Getting started',
  body: 'First ![deck]($deckA) then ![deck]($deckB)',
  createdAt: DateTime.utc(2024),
);

final deckAData = api.Deck(
  id: deckA,
  authorId: 'author',
  title: 'Deck A',
  description: 'Deck A description',
  cards: [],
);

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  test('loads the lesson, its state and its decks', () async {
    final service = FakeLessonService(
      lessonResponses: [lesson],
      decks: {deckA: deckAData},
    );

    final actual = await loadLesson(service, courseId, lessonId);

    expect(actual.lesson, lesson);
    expect(actual.deckStates, <String, bool>{});
    expect(actual.stateError, isNull);
    expect(actual.decks, {deckA: deckAData});
    expect(service.getDeckCalls, [deckA, deckB]);
  });

  test('a failed lesson state is reported, not thrown', () async {
    final service = FakeLessonService(
      lessonResponses: [lesson],
      lessonStateError: Exception('state down'),
      decks: {deckA: deckAData},
    );

    final actual = await loadLesson(service, courseId, lessonId);

    expect(actual.lesson, lesson);
    expect(actual.deckStates, <String, bool>{});
    expect(actual.stateError.toString(), 'Exception: state down');
  });

  test('a failed lesson is thrown', () async {
    final service = FakeLessonService(
      lessonResponses: [Exception('network down')],
    );

    expect(loadLesson(service, courseId, lessonId), throwsA(isA<Exception>()));
  });
}
