import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/presentation/widgets/index.dart';

import '../../../../../constants/index.dart';
import '../fake_app.dart';

void main() {
  testWidgets('should accept a text and emit it when the button is pressed',
      (tester) async {
    String taskDescription = '';

    await tester.pumpWidget(FakeScaffoldApp(
      child: TaskAddInput(
        onAddTask: (description) => taskDescription = description,
      ),
    ));

    await tester.enterText(find.byType(TextFormField), kDescription);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(taskDescription, kDescription);
  });

  testWidgets('should accept a text and emit it when the field is submited',
      (tester) async {
    String taskDescription = '';

    await tester.pumpWidget(FakeScaffoldApp(
      child: TaskAddInput(
        onAddTask: (description) => taskDescription = description,
      ),
    ));

    final fieldFinder = find.byType(TextFormField);

    await tester.showKeyboard(fieldFinder);
    await tester.enterText(fieldFinder, kDescription);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(taskDescription, kDescription);
  });
}
