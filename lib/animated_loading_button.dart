import 'dart:async';
import 'package:animated_loading_button/animations/faded_animation.dart';
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
    return FadedAnimation(
      onAsyncCallFinished: widget.onAsyncCallFinished,
      onPress: widget.onPress,
      duration: const Duration(
        milliseconds: 1000,
      ),
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[900],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
