import 'package:flutter/material.dart';

///
class AnimatedTray extends StatelessWidget {
  final AnimationController animationController;
  final Widget? child;

  final Animation<double> opacity;

  AnimatedTray({
    required this.animationController,
    this.child,
    Key? key,
  })  : opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              0.150,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return Opacity(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          opacity: opacity.value,
        );
      },
    );
  }
}
