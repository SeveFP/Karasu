import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/router.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/views/review.dart';

import 'config_bundle.dart';

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  testWidgets('the review route passes its scope to the review screen', (
    tester,
  ) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const SizedBox(),
      ),
    );

    navigatorKey.currentState!.pushNamed(
      AppRouter.review,
      arguments: {'lessonId': 'lesson-1'},
    );
    await tester.pumpAndSettle();

    final actual = tester.widget<ReviewView>(find.byType(ReviewView));
    expect(actual.lessonId, 'lesson-1');
    expect(actual.deckId, isNull);
    expect(actual.courseId, isNull);
  });
}
