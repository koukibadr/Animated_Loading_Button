import 'dart:async';
import 'package:animated_loading_button/animations/faded_animation.dart';
import 'package:animated_loading_button/animations/rotated_icon_animation.dart';
import 'package:animated_loading_button/constants/arrays.dart';
import 'package:animated_loading_button/constants/values.dart';
import 'package:flutter/material.dart';

import 'animations/color_changing_animation.dart';
import 'animations/progress_indicator_animation.dart';

// ignore: must_be_immutable
class AnimatedLoadingButton<T> extends StatefulWidget {
  AnimatedLoadingButton.iconRotation({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonIcon,
    required this.buttonText,
    this.buttonColor = ConstantValues.defaultButtonColor,
    this.animationDuration = ConstantValues.defaultDuration,
    this.buttonRadius,
    this.buttonShadow,
    this.buttonWidth = ConstantValues.defaultWidth,
    this.buttonHeight = ConstantValues.defaultHeight,
  }) : super(key: key) {
    assert(buttonIcon != null && buttonText != null);

    buttonChild = null;
    colors = [];
    _buttonAnimation = ButtonAnimation.rotatedIcon;
    progressIndicatorColor = null;
    progressIndicatorBackground = null;
    progressIndicatorSize = 0;
  }

  AnimatedLoadingButton.colorChangingButton({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    required this.colors,
    this.animationDuration = ConstantValues.defaultDuration,
    this.buttonRadius,
    this.buttonShadow,
    this.buttonWidth = ConstantValues.defaultWidth,
    this.buttonHeight = ConstantValues.defaultHeight,
  }) : super(key: key) {
    assert(buttonChild != null && colors.length > 1);

    buttonColor = Colors.blue;
    buttonIcon = null;
    buttonText = null;
    _buttonAnimation = ButtonAnimation.colorChanging;
    progressIndicatorColor = null;
    progressIndicatorBackground = null;
    progressIndicatorSize = 0;
  }

  AnimatedLoadingButton.fadingAnimation({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    this.animationDuration = ConstantValues.defaultDuration,
    this.buttonRadius,
    this.buttonShadow,
    this.buttonWidth = ConstantValues.defaultWidth,
    this.buttonHeight = ConstantValues.defaultHeight,
    this.buttonColor = ConstantValues.defaultButtonColor,
  }) : super(key: key) {
    assert(buttonChild != null);

    buttonIcon = null;
    buttonText = null;
    colors = [];
    _buttonAnimation = ButtonAnimation.fadingButton;
    progressIndicatorColor = null;
    progressIndicatorBackground = null;
    progressIndicatorSize = 0;
  }

  AnimatedLoadingButton.progressIndicator({
    Key? key,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    this.animationDuration = ConstantValues.defaultDuration,
    this.buttonRadius,
    this.buttonShadow,
    this.buttonWidth = ConstantValues.defaultWidth,
    this.buttonHeight = ConstantValues.defaultHeight,
    this.buttonColor = ConstantValues.defaultButtonColor,
    this.progressIndicatorColor = ConstantValues.defaultIndicatorColor,
    this.progressIndicatorBackground =
        ConstantValues.defaultIndicatorBackground,
    this.progressIndicatorSize = ConstantValues.defaultIndicatorSize,
  }) : super(key: key) {
    assert(buttonChild != null);
    assert(progressIndicatorColor != null);
    assert(progressIndicatorBackground != null);

    buttonIcon = null;
    buttonText = null;
    colors = [];
    _buttonAnimation = ButtonAnimation.progressIndicator;
  }

  ///Future callback invoked when pressing the button
  ///required in all button types
  final Future<T> Function() onPress;

  ///callback invoked when [onPress] is finished
  ///required in all button types.
  final Function(T) onAsyncCallFinished;

  ///the button width
  ///by default the width is set to 200
  final double buttonWidth;

  ///the button height
  ///by default it's set to 50
  final double buttonHeight;

  ///the animation duration applied in all animations
  ///except progress indicator animation
  final Duration animationDuration;

  ///the button color, applied in all types except
  ///color changing animation button
  ///by default button color is `Colors.blue`
  late Color buttonColor;

  ///button radius by default it's set to null
  final BorderRadius? buttonRadius;

  ///the button shadow, by default it's null
  final BoxShadow? buttonShadow;

  ///the widget that will be rendered inside the button
  late Widget? buttonChild;

  ///required when using animatedIcon button
  ///the icon (widget) that will be drawn inside the button
  late Widget? buttonIcon;

  ///required when using animatedIcon button,
  ///the text that will be rendered inside the button
  late Text? buttonText;

  ///list of colors that will be used in creating
  ///color changing button animation
  ///
  ///should contains 2 colors at least
  late List<Color> colors;

  ///the progress indicator color
  ///by default it's set to `Colors.blue`
  late Color? progressIndicatorColor;

  ///the progress indicator background color
  ///by default it's set to `Colors.white`
  late Color? progressIndicatorBackground;

  ///the progress indicator height,
  ///by default it's set to 5
  late double progressIndicatorSize;

  late ButtonAnimation _buttonAnimation;

  @override
  _AnimatedLoadingButtonState createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton> {
  @override
  Widget build(BuildContext context) {
    return _renderAnimation();
  }

  Widget _renderAnimation() {
    switch (widget._buttonAnimation) {
      case ButtonAnimation.rotatedIcon:
        return RotatedIconAnimation(
          duration: widget.animationDuration,
          onPress: widget.onPress,
          onAsyncCallFinished: widget.onAsyncCallFinished,
          buttonText: widget.buttonText!,
          icon: widget.buttonIcon!,
          buttonShadow: widget.buttonShadow,
          buttonRadius: widget.buttonRadius,
          buttonWidth: widget.buttonWidth,
          buttonHeight: widget.buttonHeight,
          color: widget.buttonColor,
        );
      case ButtonAnimation.colorChanging:
        return ColorChangingAnimation(
          duration: widget.animationDuration,
          onPress: widget.onPress,
          onAsyncCallFinished: widget.onAsyncCallFinished,
          buttonChild: widget.buttonChild!,
          colors: widget.colors,
          buttonShadow: widget.buttonShadow,
          buttonRadius: widget.buttonRadius,
          buttonWidth: widget.buttonWidth,
          buttonHeight: widget.buttonHeight,
        );
      case ButtonAnimation.fadingButton:
        return FadedAnimation(
          child: widget.buttonChild!,
          duration: widget.animationDuration,
          onAsyncCallFinished: widget.onAsyncCallFinished,
          onPress: widget.onPress,
          buttonRadius: widget.buttonRadius,
          buttonShadow: widget.buttonShadow,
          buttonWidth: widget.buttonWidth,
          buttonHeight: widget.buttonHeight,
          color: widget.buttonColor,
        );
      case ButtonAnimation.progressIndicator:
        return ProgressIndicatorAnimation(
          onPress: widget.onPress,
          onAsyncCallFinished: widget.onAsyncCallFinished,
          buttonChild: widget.buttonChild!,
          color: widget.buttonColor,
          buttonWidth: widget.buttonWidth,
          buttonHeight: widget.buttonHeight,
          buttonRadius: widget.buttonRadius,
          buttonShadow: widget.buttonShadow,
          progressIndicatorBackground: widget.progressIndicatorBackground!,
          progressIndicatorColor: widget.progressIndicatorColor!,
          progressIndicatorSize: widget.progressIndicatorSize,
        );
      default:
        return Container();
    }
  }
}
