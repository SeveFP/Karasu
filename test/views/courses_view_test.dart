import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/views/courses.dart';

import '../config_bundle.dart';

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  testWidgets('review all opens review without a scope', (tester) async {
    final pushed = <RouteSettings>[];

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: (settings) {
          pushed.add(settings);
          return MaterialPageRoute(builder: (_) => const SizedBox());
        },
        home: const CoursesView(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Review all'));
    await tester.pumpAndSettle();

    expect(pushed.single.name, '/review');
    expect(pushed.single.arguments, isNull);
  });
}
