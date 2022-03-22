import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/presentation/widgets/index.dart';

import '../fake_app.dart';

void main() {
  late final AnimationController controller;

  setUp(() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: const TestVSync(),
    );
  });

  tearDown(() {
    controller.dispose();
  });

  testWidgets(
      'should change its opacity from zero to one reversible when the controller animates',
      (tester) async {
    await tester.pumpWidget(FakeScaffoldApp(
      child: AnimatedTray(
        animationController: controller,
      ),
    ));

    final finder = find.byType(Opacity);

    expect(tester.firstWidget<Opacity>(finder).opacity, 0);

    controller.forward();
    await tester.pumpAndSettle();

    expect(tester.firstWidget<Opacity>(finder).opacity, 1.0);

    controller.reverse();
    await tester.pumpAndSettle();

    expect(tester.firstWidget<Opacity>(finder).opacity, 0);
  });
}
