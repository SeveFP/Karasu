import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/main.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/openapi_client.dart';

import 'config_bundle.dart';

void main() {
  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
    await OpenApiClient.instance.initialize();
  });

  testWidgets('the app starts on the login screen', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Log in'), findsOneWidget);
  });
}
