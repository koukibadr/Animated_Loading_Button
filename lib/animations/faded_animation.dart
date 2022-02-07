import 'dart:async';

import 'package:flutter/material.dart';

class FadedAnimation<T> extends StatefulWidget {
  const FadedAnimation({
    Key? key,
    required this.child,
    required this.duration,
    required this.onAsyncCallFinished,
    required this.onPress,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;

  @override
  State<FadedAnimation> createState() => _FadedAnimationState();
}

class _FadedAnimationState extends State<FadedAnimation> {
  var opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var timer = Timer.periodic(
          const Duration(
            milliseconds: 1000,
          ),
          (timer) {
            setState(
              () {
                if (opacity == 1.0) {
                  opacity = 0;
                } else {
                  opacity = 1.0;
                }
              },
            );
          },
        );
        widget.onPress.call().then((value) {
          timer.cancel();
          setState(() {
            opacity = 1;
          });
          widget.onAsyncCallFinished.call(value);
        });
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}
