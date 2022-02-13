import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RotatedIconAnimation<T> extends StatefulWidget {
  const RotatedIconAnimation({
    Key? key,
    required this.duration,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    required this.color,
  }) : super(key: key);

  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget buttonChild;
  final Color color;

  @override
  _RotatedIconAnimationState createState() => _RotatedIconAnimationState();
}

class _RotatedIconAnimationState extends State<RotatedIconAnimation> {

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var timer = Timer.periodic(Duration(milliseconds: widget.duration.inMilliseconds ~/ 20), (timer) {
          setState(() {
            angle += 0.1;
          });
        });
        widget.onPress.call().then((value){
          timer.cancel();
          setState(() {
            angle = 0;
          });
          widget.onAsyncCallFinished.call(value);
        });
      },
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: pi * angle,
              child: const Icon(
                Icons.login,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
