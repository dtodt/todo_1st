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

  testWidgets('should change its color when the controller animates',
      (tester) async {
    await tester.pumpWidget(FakeScaffoldApp(
      child: AnimatedAddCancelButton(
        animationController: controller,
        onPressed: () {},
      ),
    ));

    final finder = find.byType(FloatingActionButton);

    expect(tester.firstWidget<FloatingActionButton>(finder).backgroundColor,
        Colors.lightBlue);

    controller.forward();
    await tester.pumpAndSettle();

    expect(tester.firstWidget<FloatingActionButton>(finder).backgroundColor,
        const Color(0xFFA62E2E));
  });

  testWidgets('should emit onPress when the button is pressed', (tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(FakeScaffoldApp(
      child: AnimatedAddCancelButton(
        animationController: controller,
        onPressed: () {
          wasPressed = true;
        },
      ),
    ));

    final finder = find.byType(FloatingActionButton);

    await tester.tap(finder);
    await tester.pumpAndSettle();

    expect(wasPressed, true);
  });
}
