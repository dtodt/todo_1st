import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:todo1st/app/modules/todos/presentation/pages/index.dart';
import 'package:todo1st/app/modules/todos/todos_module.dart';

import '../../../../../constants/index.dart';
import '../fake_app.dart';

void main() {
  setUpAll(() {
    initModule(TodosModule());
  });

  testWidgets('should add a new todo to the list', (tester) async {
    await tester.pumpWidget(const FakeApp(
      child: TodosPage(),
    ));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), kDescription);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(find.text(kDescription), findsOneWidget);

    await tester.tap(find.text(kDescription));
    await tester.pumpAndSettle();
  });
}
