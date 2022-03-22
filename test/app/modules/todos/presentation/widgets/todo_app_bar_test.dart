import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/presentation/widgets/index.dart';

import '../../../../../overrides/index.dart';

const title = 'Test';

void main() {
  testWidgets('todo app bar should load the title correctly', (tester) async {
    await tester.pumpWidget(const FakeSliverApp(
      child: TodoAppBar(title),
    ));
    await tester.pumpAndSettle();

    expect(find.text(title), findsOneWidget);
  });

  // TODO verify a way to test if the app icon loads correctly
}
