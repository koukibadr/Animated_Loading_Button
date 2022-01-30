import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedLoadingButton extends StatefulWidget {
  const AnimatedLoadingButton({Key? key}) : super(key: key);

  @override
  _AnimatedLoadingButtonState createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton> {
  var opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Timer.periodic(
          const Duration(milliseconds: 2000),
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
      },
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(
          milliseconds: 2000,
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
        ),
      ),
    );
  }
}
