import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/presentation/widgets/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../overrides/index.dart';

void main() {
  testWidgets('should accept a text and emit it when the field is submited',
      (tester) async {
    String taskDescription = '';

    await tester.pumpWidget(FakeScaffoldApp(
      child: TodoAddInput(
        onAddTask: (description) => taskDescription = description,
      ),
    ));

    final buttonFinder = find.byType(FloatingActionButton).first;
    final fieldFinder = find.byType(TextFormField);

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    await tester.showKeyboard(fieldFinder);
    await tester.enterText(fieldFinder, kDescription);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(taskDescription, kDescription);
  });
}
