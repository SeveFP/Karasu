import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_loader.dart';
import 'package:karasu/views/lesson.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

import '../fake_lesson_service.dart';
import '../config_bundle.dart';

const courseId = 'fb9ffe2c-ad66-4766-9b7b-46fd5d9acd72';
const lessonId = '334ddbf8-1acc-405b-86d8-49f0d1ca636c';

final listedLesson = api.BodylessLessonWithProgress(
  id: lessonId,
  courseId: courseId,
  order: 1,
  title: 'Introduction',
  description: 'Getting started',
  createdAt: DateTime.utc(2024),
  isCompleted: false,
  isCurrent: true,
);

final fullLesson = api.Lesson(
  id: lessonId,
  courseId: courseId,
  order: 1,
  title: 'Introduction',
  description: 'Getting started',
  body: 'The body of the lesson',
  createdAt: DateTime.utc(2024),
);

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  testWidgets('loads the lesson body by ID and shows it', (tester) async {
    final service = FakeLessonService(lessonResponses: [fullLesson]);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LessonView(lesson: listedLesson, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('The body of the lesson'), findsOneWidget);
    expect(service.getLessonCalls, [lessonId]);
  });

  testWidgets('a failed body shows the error and retries', (tester) async {
    final service = FakeLessonService(
      lessonResponses: [Exception('network down'), fullLesson],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LessonView(lesson: listedLesson, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('network down'), findsOneWidget);
    expect(find.text('The body of the lesson'), findsNothing);

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('The body of the lesson'), findsOneWidget);
    expect(service.getLessonCalls, [lessonId, lessonId]);
  });

  testWidgets('a failed lesson state still shows the body', (tester) async {
    final service = FakeLessonService(
      lessonResponses: [fullLesson],
      lessonStateError: Exception('state down'),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LessonView(lesson: listedLesson, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('The body of the lesson'), findsOneWidget);
    expect(find.textContaining('Could not load progress'), findsOneWidget);
  });

  testWidgets('the loader stays until the lesson state is back', (
    tester,
  ) async {
    final lessonStateGate = Completer<void>();
    final service = FakeLessonService(
      lessonResponses: [fullLesson],
      lessonStateGate: lessonStateGate,
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LessonView(lesson: listedLesson, service: service),
      ),
    );
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('The body of the lesson'), findsNothing);

    lessonStateGate.complete();
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('The body of the lesson'), findsOneWidget);
  });

  testWidgets('a preloaded lesson opens without loading it again', (
    tester,
  ) async {
    final service = FakeLessonService();
    final preloaded = Future.value(
      LoadedLesson(
        lesson: fullLesson,
        deckStates: {},
        stateError: null,
        decks: {},
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LessonView(
          lesson: listedLesson,
          preloaded: preloaded,
          service: service,
        ),
      ),
    );
    await tester.pump();

    expect(find.text('The body of the lesson'), findsOneWidget);
    expect(service.getLessonCalls, <String>[]);
  });

  testWidgets('a preloaded deck shows without fetching it', (tester) async {
    const deckId = 'aaaaaaaa-0000-0000-0000-000000000000';
    final service = FakeLessonService();
    final preloaded = Future.value(
      LoadedLesson(
        lesson: api.Lesson(
          id: lessonId,
          courseId: courseId,
          order: 1,
          title: 'Introduction',
          description: 'Getting started',
          body: '![deck]($deckId)',
          createdAt: DateTime.utc(2024),
        ),
        deckStates: {},
        stateError: null,
        decks: {
          deckId: api.Deck(
            id: deckId,
            authorId: 'author',
            title: 'Particles',
            description: 'Deck description',
            cards: [
              api.Card(
                id: 'card-1',
                title: 'Which particle marks the topic?',
                possibleAnswers: [
                  api.Answer(id: 'answer-1', text: 'wa', isCorrect: true),
                  api.Answer(id: 'answer-2', text: 'ga', isCorrect: false),
                ],
                kind: api.CardKindEnum.singleChoice,
              ),
            ],
          ),
        },
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LessonView(
          lesson: listedLesson,
          preloaded: preloaded,
          service: service,
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Particles'), findsOneWidget);
    expect(service.getDeckCalls, <String>[]);
  });

  testWidgets('retry after a failed preload loads the lesson again', (
    tester,
  ) async {
    final service = FakeLessonService(lessonResponses: [fullLesson]);
    final preloaded = Future<LoadedLesson>.error(Exception('network down'))
      ..ignore();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: LessonView(
          lesson: listedLesson,
          preloaded: preloaded,
          service: service,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('network down'), findsOneWidget);

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('The body of the lesson'), findsOneWidget);
    expect(service.getLessonCalls, [lessonId]);
  });
}
