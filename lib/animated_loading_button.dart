import 'dart:async';
import 'package:animated_loading_button/animations/rotated_icon_animation.dart';
import 'package:animated_loading_button/constants/arrays.dart';
import 'package:flutter/material.dart';

class AnimatedLoadingButton<T> extends StatefulWidget {
  
  AnimatedLoadingButton.iconRotation(
      {Key? key,
      required this.onPress,
      required this.onAsyncCallFinished,
      required this.buttonIcon,
      required this.buttonText,
      this.buttonColor = Colors.blue,
      this.animationDuration = const Duration(milliseconds: 2000),
      this.buttonRadius,
      this.buttonShadow})
      : super(key: key) {
    child = null;
    colors = [];
    buttonAnimation = ButtonAnimation.rotatedIcon;
    assert(buttonIcon != null && buttonText != null);
  }

  AnimatedLoadingButton.colorChangingButton(
      {Key? key,
      required this.onPress,
      required this.onAsyncCallFinished,
      required this.child,
      required this.colors,
      this.animationDuration = const Duration(milliseconds: 2000),
      this.buttonRadius,
      this.buttonShadow})
      : super(key: key) {
    buttonColor = Colors.blue;
    buttonIcon = null;
    buttonText = null;
    buttonAnimation = ButtonAnimation.colorChanging;
  }

  AnimatedLoadingButton.fadingAnimation(
      {Key? key,
      required this.onPress,
      required this.onAsyncCallFinished,
      required this.child,
      this.animationDuration = const Duration(milliseconds: 2000),
      this.buttonRadius,
      this.buttonShadow})
      : super(key: key) {
    buttonColor = Colors.blue;
    buttonIcon = null;
    buttonText = null;
    colors = [];
    buttonAnimation = ButtonAnimation.fadingButton;
  }

  AnimatedLoadingButton.progressIndicator(
      {Key? key,
      required this.onPress,
      required this.onAsyncCallFinished,
      required this.child,
      this.animationDuration = const Duration(milliseconds: 2000),
      this.buttonRadius,
      this.buttonShadow})
      : super(key: key) {
    buttonColor = Colors.blue;
    buttonIcon = null;
    buttonText = null;
    colors = [];
    buttonAnimation = ButtonAnimation.progressIndicator;
  }

  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  late Widget? child;
  final Duration animationDuration;

  //for rotated icon
  late Widget? buttonIcon;
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
    return _renderAnimation();
  }

  Widget _renderAnimation() {
    switch (widget.buttonAnimation) {
      case ButtonAnimation.rotatedIcon:
        return RotatedIconAnimation(
          duration: widget.animationDuration,
          onPress: widget.onPress,
          onAsyncCallFinished: widget.onAsyncCallFinished,
          buttonText: widget.buttonText!,
          icon: widget.buttonIcon!,
          buttonShadow: widget.buttonShadow,
          buttonRadius: widget.buttonRadius,
          buttonWidth: 200,
          buttonHeight: 50,
          color: widget.buttonColor,
        );
      // case ButtonAnimation.colorChanging:
      //   return ColorChangingAnimation(
      //     duration: duration,
      //     onPress: onPress,
      //     onAsyncCallFinished: onAsyncCallFinished,
      //     buttonChild: buttonChild,
      //     colors: colors,
      //   );
      // case ButtonAnimation.fadingButton:
      //   return FadedAnimation(
      //     child: child,
      //     duration: duration,
      //     onAsyncCallFinished: onAsyncCallFinished,
      //     onPress: onPress,
      //   );
      // case ButtonAnimation.progressIndicator:
      //   return ProgressIndicatorAnimation(
      //     duration: duration,
      //     onPress: onPress,
      //     onAsyncCallFinished: onAsyncCallFinished,
      //     buttonChild: buttonChild,
      //     color: color,
      //   );
      default:
        return Container();
    }
  }
}
