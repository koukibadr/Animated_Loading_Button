import 'package:flutter/material.dart';

class FadedAnimation extends StatelessWidget {
  final Widget child;
  final double opacity;

  const FadedAnimation({
    Key? key,
    required this.child,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(
        milliseconds: 1000,
      ),
      child: child,
    );
  }
}
