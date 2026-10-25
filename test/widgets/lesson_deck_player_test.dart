import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/widgets/lesson_deck_player.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

import '../config_bundle.dart';

final deck = api.Deck(
  id: 'deck-1',
  authorId: 'author',
  title: 'Particles',
  description: 'Deck description',
  cards: [
    api.Card(
      id: 'card-1',
      title: 'Which particle marks the topic?',
      possibleAnswers: [
        api.Answer(id: 'card-1-right', text: 'wa', isCorrect: true),
        api.Answer(id: 'card-1-wrong', text: 'ga', isCorrect: false),
      ],
      kind: api.CardKindEnum.singleChoice,
    ),
  ],
);

final fillInDeck = api.Deck(
  id: 'deck-2',
  authorId: 'author',
  title: 'Blanks',
  description: 'Deck description',
  cards: [
    api.Card(
      id: 'card-3',
      title: 'Watashi ![input](0) gakusei desu',
      possibleAnswers: [
        api.Answer(id: 'card-3-right', text: 'wa', isCorrect: true),
        api.Answer(id: 'card-3-wrong', text: 'wrong', isCorrect: false),
      ],
      kind: api.CardKindEnum.fillInTheBlanks,
    ),
  ],
);

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  testWidgets('a completed deck opens review for that deck', (tester) async {
    final pushed = <RouteSettings>[];

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: (settings) {
          pushed.add(settings);
          return MaterialPageRoute(builder: (_) => const SizedBox());
        },
        home: Scaffold(
          body: LessonDeckPlayer(
            deck: deck,
            initiallyCompleted: true,
            onCompleted: (_) {},
            playResultSound: (_) {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Restart'), findsOneWidget);

    await tester.tap(find.text('Review'));
    await tester.pumpAndSettle();

    expect(pushed.single.name, '/review');
    expect(pushed.single.arguments, {'deckId': 'deck-1'});
  });

  testWidgets('two quick taps complete the deck once', (tester) async {
    final completed = <String>[];
    final sounds = <bool>[];

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LessonDeckPlayer(
            deck: deck,
            onCompleted: completed.add,
            playResultSound: sounds.add,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('wa'));
    await tester.tap(find.text('ga'));
    await tester.pumpAndSettle();

    expect(completed, ['deck-1']);
    expect(sounds, [true]);
  });

  testWidgets('a fill-in-the-blanks card is answered by typing', (
    tester,
  ) async {
    final completed = <String>[];
    final sounds = <bool>[];

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LessonDeckPlayer(
            deck: fillInDeck,
            onCompleted: completed.add,
            playResultSound: sounds.add,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), ' WA ');
    await tester.pump();
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(completed, ['deck-2']);
    expect(sounds, [true]);
  });
}
