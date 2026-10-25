import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/router.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/views/lessons.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

import '../fake_lesson_service.dart';
import '../config_bundle.dart';

const courseId = 'fb9ffe2c-ad66-4766-9b7b-46fd5d9acd72';

final lesson1 = api.BodylessLessonWithProgressEdge(
  node: api.BodylessLessonWithProgress(
    id: 'lesson-1',
    courseId: courseId,
    order: 1,
    title: 'Lesson 1',
    description: 'Description 1',
    createdAt: DateTime.utc(2024),
    isCompleted: false,
    isCurrent: true,
  ),
  cursor: 'c1',
);

final lesson2 = api.BodylessLessonWithProgressEdge(
  node: api.BodylessLessonWithProgress(
    id: 'lesson-2',
    courseId: courseId,
    order: 2,
    title: 'Lesson 2',
    description: 'Description 2',
    createdAt: DateTime.utc(2024),
    isCompleted: false,
    isCurrent: false,
  ),
  cursor: 'c2',
);

final lesson3 = api.BodylessLessonWithProgressEdge(
  node: api.BodylessLessonWithProgress(
    id: 'lesson-3',
    courseId: courseId,
    order: 3,
    title: 'Lesson 3',
    description: 'Description 3',
    createdAt: DateTime.utc(2024),
    isCompleted: false,
    isCurrent: false,
  ),
  cursor: 'c3',
);

final lesson4 = api.BodylessLessonWithProgressEdge(
  node: api.BodylessLessonWithProgress(
    id: 'lesson-4',
    courseId: courseId,
    order: 4,
    title: 'Lesson 4',
    description: 'Description 4',
    createdAt: DateTime.utc(2024),
    isCompleted: false,
    isCurrent: false,
  ),
  cursor: 'c4',
);

final completedLesson1 = api.BodylessLessonWithProgressEdge(
  node: api.BodylessLessonWithProgress(
    id: 'lesson-1',
    courseId: courseId,
    order: 1,
    title: 'Lesson 1',
    description: 'Description 1',
    createdAt: DateTime.utc(2024),
    isCompleted: true,
    isCurrent: false,
  ),
  cursor: 'c1',
);

final currentLesson2 = api.BodylessLessonWithProgressEdge(
  node: api.BodylessLessonWithProgress(
    id: 'lesson-2',
    courseId: courseId,
    order: 2,
    title: 'Lesson 2',
    description: 'Description 2',
    createdAt: DateTime.utc(2024),
    isCompleted: false,
    isCurrent: true,
  ),
  cursor: 'c2',
);

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  testWidgets('shows the first page of lessons', (tester) async {
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1, lesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c2',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Lesson 1'), findsOneWidget);
    expect(find.text('Lesson 2'), findsOneWidget);
    expect(service.getLessonsCalls, [const GetLessonsCall(courseId)]);
  });

  testWidgets('scrolling to the bottom loads the next page', (tester) async {
    tester.view.physicalSize = const Size(400, 300);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1, lesson2, lesson3],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: true,
            startCursor: 'c1',
            endCursor: 'c3',
          ),
        ),
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson4],
          pageInfo: api.PageInfo(
            hasPreviousPage: true,
            hasNextPage: false,
            startCursor: 'c4',
            endCursor: 'c4',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(service.getLessonsCalls, [const GetLessonsCall(courseId)]);

    await tester.drag(find.byType(ListView), const Offset(0, -1000));
    await tester.pumpAndSettle();

    expect(find.text('Lesson 4'), findsOneWidget);
    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, after: 'c3'),
    ]);
  });

  testWidgets('a first page shorter than the screen loads the next page', (
    tester,
  ) async {
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: true,
            startCursor: 'c1',
            endCursor: 'c1',
          ),
        ),
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: true,
            hasNextPage: false,
            startCursor: 'c2',
            endCursor: 'c2',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Lesson 1'), findsOneWidget);
    expect(find.text('Lesson 2'), findsOneWidget);
    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, after: 'c1'),
    ]);
  });

  testWidgets('coming back reloads the lessons already shown', (tester) async {
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1, lesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c2',
          ),
        ),
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1, lesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c2',
          ),
        ),
      ],
    );
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (_) => const SizedBox()),
    );
    await tester.pumpAndSettle();
    navigatorKey.currentState!.pop();
    await tester.pumpAndSettle();

    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, first: 2),
    ]);
  });

  testWidgets('a failed first page shows the error and retries', (
    tester,
  ) async {
    final service = FakeLessonService(
      lessonsResponses: [
        Exception('network down'),
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c1',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('network down'), findsOneWidget);

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('Lesson 1'), findsOneWidget);
  });

  testWidgets('a failed next page shows retry at the bottom', (tester) async {
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: true,
            startCursor: 'c1',
            endCursor: 'c1',
          ),
        ),
        Exception('network down'),
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: true,
            hasNextPage: false,
            startCursor: 'c2',
            endCursor: 'c2',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Lesson 1'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, after: 'c1'),
    ]);

    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('Lesson 2'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, after: 'c1'),
      const GetLessonsCall(courseId, after: 'c1'),
    ]);
  });

  testWidgets('each lesson shows its icon from its progress', (tester) async {
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [completedLesson1, currentLesson2, lesson3],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c3',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    expect(find.byIcon(Icons.menu_book_rounded), findsOneWidget);
    expect(find.byIcon(Icons.book_rounded), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsNothing);
  });

  testWidgets('a locked lesson shows a lock and does not open', (tester) async {
    await tester.runAsync(
      () => ConfigService().loadConfig(
        bundle: TestConfigBundle('test/config/lessons_locked.json'),
      ),
    );
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [currentLesson2, lesson3],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c2',
            endCursor: 'c3',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.lock), findsOneWidget);

    await tester.tap(find.text('Lesson 3'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'This lesson is locked. Please complete previous lessons first.',
      ),
      findsOneWidget,
    );
    expect(find.byType(LessonsView), findsOneWidget);
  });

  testWidgets('coming back shows the updated icons', (tester) async {
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1, lesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c2',
          ),
        ),
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [completedLesson1, currentLesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c2',
          ),
        ),
      ],
    );
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check_circle_rounded), findsNothing);

    navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (_) => const SizedBox()),
    );
    await tester.pumpAndSettle();
    navigatorKey.currentState!.pop();
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    expect(find.byIcon(Icons.menu_book_rounded), findsOneWidget);
  });

  testWidgets('coming back while a next page loads reloads after it', (
    tester,
  ) async {
    final nextPage =
        Completer<api.BodylessLessonsWithProgressConnectionResponse>();
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: true,
            startCursor: 'c1',
            endCursor: 'c1',
          ),
        ),
        nextPage.future,
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [completedLesson1, currentLesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c2',
          ),
        ),
      ],
    );
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pump();
    await tester.pump();

    navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (_) => const SizedBox()),
    );
    await tester.pump(const Duration(seconds: 1));
    navigatorKey.currentState!.pop();
    await tester.pump(const Duration(seconds: 1));

    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, after: 'c1'),
    ]);

    nextPage.complete(
      api.BodylessLessonsWithProgressConnectionResponse(
        edges: [lesson2],
        pageInfo: api.PageInfo(
          hasPreviousPage: true,
          hasNextPage: false,
          startCursor: 'c2',
          endCursor: 'c2',
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, after: 'c1'),
      const GetLessonsCall(courseId, first: 2),
    ]);
    expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
  });

  testWidgets('an empty next page ends the paging', (tester) async {
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: true,
            startCursor: 'c1',
            endCursor: 'c1',
          ),
        ),
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [],
          pageInfo: api.PageInfo(
            hasPreviousPage: true,
            hasNextPage: true,
            startCursor: '',
            endCursor: '',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Lesson 1'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
    expect(service.getLessonsCalls, [
      const GetLessonsCall(courseId),
      const GetLessonsCall(courseId, after: 'c1'),
    ]);
  });

  testWidgets('the current lesson is preloaded and opens already loaded', (
    tester,
  ) async {
    const deckId = 'aaaaaaaa-0000-0000-0000-000000000000';
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [completedLesson1, currentLesson2],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c2',
          ),
        ),
      ],
      lessonResponses: [
        api.Lesson(
          id: 'lesson-2',
          courseId: courseId,
          order: 2,
          title: 'Lesson 2',
          description: 'Description 2',
          body: 'The body of lesson 2 ![deck]($deckId)',
          createdAt: DateTime.utc(2024),
        ),
      ],
      decks: {
        deckId: api.Deck(
          id: deckId,
          authorId: 'author',
          title: 'Particles',
          description: 'Deck description',
          cards: [],
        ),
      },
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    expect(service.getLessonCalls, ['lesson-2']);
    expect(service.getDeckCalls, [deckId]);

    await tester.tap(find.text('Lesson 2'));
    await tester.pumpAndSettle();

    expect(find.textContaining('The body of lesson 2'), findsOneWidget);
    expect(service.getLessonCalls, ['lesson-2']);
    expect(service.getDeckCalls, [deckId]);
  });

  testWidgets('review course opens review for the course', (tester) async {
    final pushed = <RouteSettings>[];
    final service = FakeLessonService(
      lessonsResponses: [
        api.BodylessLessonsWithProgressConnectionResponse(
          edges: [lesson1],
          pageInfo: api.PageInfo(
            hasPreviousPage: false,
            hasNextPage: false,
            startCursor: 'c1',
            endCursor: 'c1',
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [AppRouter.routeObserver],
        onGenerateRoute: (settings) {
          pushed.add(settings);
          return MaterialPageRoute(builder: (_) => const SizedBox());
        },
        home: LessonsView(courseId: courseId, service: service),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Review course'));
    await tester.pumpAndSettle();

    expect(pushed.single.name, '/review');
    expect(pushed.single.arguments, {'courseId': courseId});
  });
}
