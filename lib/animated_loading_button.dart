import 'dart:async';
import 'package:animated_loading_button/animations/rotated_icon_animation.dart';
import 'package:animated_loading_button/constants/arrays.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingButton<T> extends StatefulWidget {
  
  AnimatedLoadingButton.iconRotation({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.icon,
    required this.buttonText,
    this.buttonColor = Colors.blue,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.buttonRadius,
    this.buttonShadow
  }) : super(key: key) {
    child = null;
    colors = [];
    buttonAnimation = ButtonAnimation.rotatedIcon;
  }

  AnimatedLoadingButton.colorChangingButton({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.child,
    required this.colors,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.buttonRadius,
    this.buttonShadow
  }) : super(key: key) {
    buttonColor = Colors.blue;
    icon = null;
    buttonText = null;
    buttonAnimation = ButtonAnimation.colorChanging;
  }

  AnimatedLoadingButton.fadingAnimation({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.buttonRadius,
    this.buttonShadow
  }) : super(key: key) {
    buttonColor = Colors.blue;
    icon = null;
    buttonText = null;
    colors = [];
    buttonAnimation = ButtonAnimation.fadingButton;
  }

  AnimatedLoadingButton.progressIndicator({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.buttonRadius,
    this.buttonShadow
  }) : super(key: key) {
    buttonColor = Colors.blue;
    icon = null;
    buttonText = null;
    colors = [];
    buttonAnimation = ButtonAnimation.progressIndicator;
  }

  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  late Widget? child;
  final Duration animationDuration;

  //for rotated icon
  late IconData? icon;
  late Text? buttonText;
  late Color buttonColor;
  BorderRadius? buttonRadius;
  BoxShadow? buttonShadow;

  //for color chaning animation
  late List<Color> colors;

  late ButtonAnimation buttonAnimation;

  @override
  _AnimatedLoadingButtonState createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton> {
  @override
  Widget build(BuildContext context) {
    return RotatedIconAnimation(
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
