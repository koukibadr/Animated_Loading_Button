import 'dart:async';
import 'package:animated_loading_button/animations/text_changing_animation.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingButton<T> extends StatefulWidget {
  const AnimatedLoadingButton({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.child,
  }) : super(key: key);

  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget child;

  @override
  _AnimatedLoadingButtonState createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton> {
  @override
  Widget build(BuildContext context) {
    return TextChangingAnimation(
      buttonChild: widget.child,
      color: Colors.blue[400]!,
      onPress: widget.onPress,
      onAsyncCallFinished: widget.onAsyncCallFinished,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
  }
}
