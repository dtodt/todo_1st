import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo1st/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('this test should work', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // TODO make this test work in each platform, it seems web is not supported yet.
    });
  });
}
