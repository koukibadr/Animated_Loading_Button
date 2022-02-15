import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RotatedIconAnimation<T> extends StatefulWidget {
  const RotatedIconAnimation({
    Key? key,
    required this.duration,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonText,
    required this.icon,
    required this.color,
    required this.buttonHeight,
    required this.buttonRadius,
    required this.buttonShadow,
    required this.buttonWidth,
  }) : super(key: key);

  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Text buttonText;
  final Widget icon;
  final Color color;
  final BoxShadow? buttonShadow;
  final BorderRadius? buttonRadius;
  final double buttonWidth;
  final double buttonHeight;

  @override
  _RotatedIconAnimationState createState() => _RotatedIconAnimationState();
}

class _RotatedIconAnimationState extends State<RotatedIconAnimation> {
  
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var timer = Timer.periodic(
            Duration(milliseconds: widget.duration.inMilliseconds ~/ 20),
            (timer) {
          setState(() {
            angle += 0.1;
          });
        });
        widget.onPress.call().then((value) {
          timer.cancel();
          setState(() {
            angle = 0;
          });
          widget.onAsyncCallFinished.call(value);
        });
      },
      child: Container(
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        decoration: BoxDecoration(
          borderRadius: widget.buttonRadius,
          color: widget.color,
          boxShadow:
              widget.buttonShadow == null ? null : [widget.buttonShadow!],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: pi * angle,
              child: widget.icon,
            ),
            const SizedBox(
              width: 15,
            ),
            widget.buttonText
          ],
        ),
      ),
    );
  }
}
