import 'dart:async';
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
      ),
    );
  }
}
