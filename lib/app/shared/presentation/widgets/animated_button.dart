import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo1st/app/app_constants.dart';

/// This button changes from add to cancel,
/// with blue and red colors respectively.
class AnimatedButton extends StatefulWidget {
  final AnimationController animationController;
  final VoidCallback? onPressed;

  const AnimatedButton({
    Key? key,
    required this.animationController,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  late Animation<Color?> _animation;

  double _angle = 0;

  @override
  void dispose() {
    widget.animationController.removeListener(_onAnimateIcon);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.animationController.addListener(_onAnimateIcon);
    _animation = ColorTween(begin: Colors.lightBlue, end: kCancelColor)
        .animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return FloatingActionButton(
          backgroundColor: _animation.value,
          child: Transform.rotate(
            angle: _angle,
            child: const Icon(Icons.add),
          ),
          onPressed: widget.onPressed!,
        );
      },
    );
  }

  void _onAnimateIcon() {
    setState(() {
      _angle = widget.animationController.value * 45 / 360 * pi * 2;
    });
  }
}
