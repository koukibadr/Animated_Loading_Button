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
        Timer.periodic(widget.duration, (timer) {
          if (selectedColorIndex < widget.colors.length - 1) {
            selectedColorIndex++;
          } else {
            selectedColorIndex = 0;
          }
          setState(() {
            selectedColor = widget.colors[selectedColorIndex];
          });
        });
      },
      child: AnimatedContainer(
        duration: widget.duration,
        //TODO update width and height attributes
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: widget.buttonChild,
      ),
    );
  }
}
