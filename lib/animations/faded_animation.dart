import 'package:flutter/material.dart';

class FadedAnimation extends StatelessWidget {

  final Widget child;
  final double opacity;
  final Duration duration;

  const FadedAnimation({
    Key? key,
    required this.child,
    required this.opacity,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      child: child,
    );
  }
}
