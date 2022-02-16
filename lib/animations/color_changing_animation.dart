import 'dart:async';
import 'package:flutter/material.dart';

class ColorChangingAnimation<T> extends StatefulWidget {
  const ColorChangingAnimation({
    Key? key,
    required this.duration,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    required this.colors,
    this.buttonRadius,
    this.buttonShadow,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);

  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget buttonChild;
  final List<Color> colors;
  final BorderRadius? buttonRadius;
  final BoxShadow? buttonShadow;
  final double buttonWidth;
  final double buttonHeight;

  @override
  _ColorChangingAnimationState createState() => _ColorChangingAnimationState();
}

class _ColorChangingAnimationState extends State<ColorChangingAnimation> {
  late Color selectedColor;
  late int selectedColorIndex;
  late Timer animationTimer;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.colors[0];
    selectedColorIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        animationTimer =
            Timer.periodic(const Duration(milliseconds: 500), (timer) {
          if (selectedColorIndex < widget.colors.length - 1) {
            selectedColorIndex++;
          } else {
            selectedColorIndex = 0;
          }
          setState(() {
            selectedColor = widget.colors[selectedColorIndex];
          });
        });
        widget.onPress.call().then((value) {
          setState(() {
            selectedColor = widget.colors[0];
          });
          animationTimer.cancel();
          widget.onAsyncCallFinished.call(value);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        decoration: BoxDecoration(
          borderRadius: widget.buttonRadius,
          color: selectedColor,
          boxShadow:
              widget.buttonShadow == null ? null : [widget.buttonShadow!],
        ),
        child: widget.buttonChild,
      ),
    );
  }
}
