import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/shared/presentation/index.dart';

import '../../../../overrides.dart';

void main() {
  final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: const TestVSync(),
  );

  tearDown(() {
    controller.reset();
  });

  testWidgets('should change its color when the controller animates',
      (tester) async {
    await tester.pumpWidget(FakeScaffoldApp(
      child: AnimatedButton(
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
      child: AnimatedButton(
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
