import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/views/review.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

import '../config_bundle.dart';
import '../fake_lesson_service.dart';
import '../fake_result_sound.dart';

final card1 = api.Card(
  id: 'card-1',
  title: 'Which particle marks the topic?',
  possibleAnswers: [
    api.Answer(id: 'card-1-right', text: 'wa', isCorrect: true),
    api.Answer(id: 'card-1-wrong', text: 'ga', isCorrect: false),
  ],
  kind: api.CardKindEnum.singleChoice,
);

final card2 = api.Card(
  id: 'card-2',
  title: 'Which particle marks the object?',
  possibleAnswers: [
    api.Answer(id: 'card-2-right', text: 'o', isCorrect: true),
    api.Answer(id: 'card-2-wrong', text: 'ni', isCorrect: false),
  ],
  kind: api.CardKindEnum.singleChoice,
);

final fillInCard = api.Card(
  id: 'card-3',
  title: 'Watashi ![input](0) gakusei desu',
  possibleAnswers: [
    api.Answer(id: 'card-3-right', text: 'wa', isCorrect: true),
    api.Answer(id: 'card-3-wrong', text: 'wrong', isCorrect: false),
  ],
  kind: api.CardKindEnum.fillInTheBlanks,
);

final cardWithoutAnswers = api.Card(
  id: 'card-4',
  title: 'A card nobody can answer',
  possibleAnswers: [],
  kind: api.CardKindEnum.singleChoice,
);

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  testWidgets('asks for the configured number of cards in its scope', (
    tester,
  ) async {
    final service = FakeLessonService(
      reviewResponses: [
        [card1],
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(
          lessonId: 'lesson-1',
          service: service,
          resultSound: FakeResultSound(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(service.getReviewCalls, [
      GetReviewCall(
        ConfigService().config.defaultMaxCards,
        lessonId: 'lesson-1',
      ),
    ]);
  });

  testWidgets('shows cards one by one and sends each answer', (tester) async {
    final service = FakeLessonService(
      reviewResponses: [
        [card1, card2],
      ],
    );
    final sound = FakeResultSound();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: sound),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Which particle marks the topic?'), findsOneWidget);
    expect(find.text('1/2'), findsOneWidget);

    await tester.tap(find.text('wa'));
    await tester.pumpAndSettle();

    expect(find.text('Which particle marks the object?'), findsOneWidget);
    expect(find.text('2/2'), findsOneWidget);
    expect(service.submitReviewAnswersCalls, [
      ['card-1-right'],
    ]);
    expect(sound.played, [true]);
  });

  testWidgets('the end shows the score and each card\'s answers', (
    tester,
  ) async {
    final service = FakeLessonService(
      reviewResponses: [
        [card1, card2],
      ],
    );
    final sound = FakeResultSound();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: sound),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('wa'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('ni'));
    await tester.pumpAndSettle();

    expect(find.text('1 / 2'), findsOneWidget);
    expect(find.text('wa'), findsOneWidget);
    expect(find.text('ni'), findsOneWidget);
    expect(find.text('o'), findsOneWidget);
    expect(find.text('ga'), findsNothing);
    expect(service.submitReviewAnswersCalls, [
      ['card-1-right'],
      ['card-2-wrong'],
    ]);
    expect(sound.played, [true, false]);
  });

  testWidgets('review again starts a new round in the same scope', (
    tester,
  ) async {
    final service = FakeLessonService(
      reviewResponses: [
        [card1],
        [card1],
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(
          deckId: 'deck-1',
          service: service,
          resultSound: FakeResultSound(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('wa'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Review again'));
    await tester.pumpAndSettle();

    expect(find.text('1/1'), findsOneWidget);

    await tester.tap(find.text('ga'));
    await tester.pumpAndSettle();

    expect(find.text('0 / 1'), findsOneWidget);
    expect(service.submitReviewAnswersCalls, [
      ['card-1-right'],
      ['card-1-wrong'],
    ]);
    expect(service.getReviewCalls, [
      GetReviewCall(ConfigService().config.defaultMaxCards, deckId: 'deck-1'),
      GetReviewCall(ConfigService().config.defaultMaxCards, deckId: 'deck-1'),
    ]);
  });

  testWidgets('no cards says there is nothing to review yet', (tester) async {
    final service = FakeLessonService(reviewResponses: [<api.Card>[]]);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: FakeResultSound()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Nothing to review yet'), findsOneWidget);
  });

  testWidgets('a failed load shows the error and retries', (tester) async {
    final service = FakeLessonService(
      reviewResponses: [
        Exception('network down'),
        [card1],
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: FakeResultSound()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('network down'), findsOneWidget);

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('Which particle marks the topic?'), findsOneWidget);
  });

  testWidgets('a failed answer send does not stop the round', (tester) async {
    final service = FakeLessonService(
      reviewResponses: [
        [card1, card2],
      ],
      submitReviewError: Exception('send failed'),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: FakeResultSound()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('wa'));
    await tester.pumpAndSettle();

    expect(find.text('Which particle marks the object?'), findsOneWidget);
  });

  testWidgets('two quick taps answer a card once', (tester) async {
    final service = FakeLessonService(
      reviewResponses: [
        [card1, card2],
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: FakeResultSound()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('wa'));
    await tester.tap(find.text('ga'));
    await tester.pumpAndSettle();

    expect(find.text('2/2'), findsOneWidget);
    expect(service.submitReviewAnswersCalls, [
      ['card-1-right'],
    ]);
  });

  testWidgets('a fill-in-the-blanks card is answered and summarised', (
    tester,
  ) async {
    final service = FakeLessonService(
      reviewResponses: [
        [fillInCard],
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: FakeResultSound()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'wa');
    await tester.pump();
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(find.text('1 / 1'), findsOneWidget);
    expect(find.text('Watashi ___ gakusei desu'), findsOneWidget);
    expect(find.text('wa'), findsOneWidget);
    expect(find.byType(Image), findsNothing);
    expect(service.submitReviewAnswersCalls, [
      ['card-3-right'],
    ]);
  });

  testWidgets('a card that cannot be answered is skipped', (tester) async {
    final service = FakeLessonService(
      reviewResponses: [
        [cardWithoutAnswers, card1],
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReviewView(service: service, resultSound: FakeResultSound()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Which particle marks the topic?'), findsOneWidget);
    expect(find.text('1/1'), findsOneWidget);
  });
}
