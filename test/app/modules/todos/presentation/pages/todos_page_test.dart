import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:todo1st/app/modules/todos/presentation/pages/index.dart';
import 'package:todo1st/app/modules/todos/todos_module.dart';
import 'package:todo1st/app/shared/data/services/index.dart';
import 'package:todo1st/app/shared/shared_module.dart';

import '../../../../../constants.dart';
import '../../../../../overrides/index.dart';

void main() {
  setUpAll(() {
    initModules([
      SharedModule(),
      TodosModule(),
    ], replaceBinds: [
      Bind<SembastService>(
        (_) => SembastServiceTester(),
        export: true,
      ),
    ]);
  });

  testWidgets('should add a new todo to the list', (tester) async {
    await Modular.isModuleReady<SharedModule>();

    await tester.pumpWidget(const FakeApp(
      child: TodosPage(),
    ));
    await tester.pumpAndSettle();

    final buttonFinder = find.byType(FloatingActionButton).first;
    final fieldFinder = find.byType(TextFormField);
    final textFinder = find.text(kDescription);

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    await tester.showKeyboard(fieldFinder);
    await tester.enterText(fieldFinder, kDescription);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(textFinder, findsOneWidget);

    await tester.tap(textFinder);
    await tester.pumpAndSettle();
  });
}
