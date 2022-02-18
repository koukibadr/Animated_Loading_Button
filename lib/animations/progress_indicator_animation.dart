import 'package:flutter/material.dart';

class ProgressIndicatorAnimation<T> extends StatefulWidget {
  const ProgressIndicatorAnimation({
    Key? key,
    required this.duration,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    required this.color,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.progressIndicatorColor,
    required this.progressIndicatorBackground,
    this.buttonRadius,
    this.buttonShadow,
  }) : super(key: key);

  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget buttonChild;
  final Color color;
  final BorderRadius? buttonRadius;
  final BoxShadow? buttonShadow;
  final double buttonWidth;
  final double buttonHeight;
  final Color progressIndicatorColor;
  final Color progressIndicatorBackground;

  @override
  _ProgressIndicatorAnimationState createState() =>
      _ProgressIndicatorAnimationState();
}

class _ProgressIndicatorAnimationState
    extends State<ProgressIndicatorAnimation> {
  double? progressValue = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          progressValue = null;
        });
        widget.onPress.call().then((result) {
          setState(() {
            progressValue = 0;
          });
          widget.onAsyncCallFinished.call(result);
        });
      },
      child: Container(
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        decoration: BoxDecoration(
          borderRadius: widget.buttonRadius,
          color: widget.color,
          boxShadow: widget.buttonShadow == null
              ? null
              : [
                  widget.buttonShadow!,
                ],
        ),
        child: Column(
          children: [
            Expanded(
              child: widget.buttonChild,
            ),
            SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: widget.progressIndicatorBackground,
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.progressIndicatorColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
