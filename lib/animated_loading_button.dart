import 'dart:async';
import 'package:animated_loading_button/animations/color_changing_animation.dart';
import 'package:animated_loading_button/animations/faded_animation.dart';
import 'package:animated_loading_button/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingButton<T> extends StatefulWidget {
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget child;

  const AnimatedLoadingButton({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.child,
  }) : super(key: key);

  @override
  _AnimatedLoadingButtonState createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton> {
  @override
  Widget build(BuildContext context) {
    
    return ColorChangingAnimation(
      buttonChild: widget.child,
      colors: [Colors.blue[100]!,Colors.blue[400]!, Colors.red],
      onPress: widget.onPress,
      onAsyncCallFinished: widget.onAsyncCallFinished,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
  }
}
