import 'package:flutter/material.dart';

class TextChangingAnimation<T> extends StatefulWidget {
  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget buttonChild;
  final Color color;

  const TextChangingAnimation({
    Key? key,
    required this.duration,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    required this.color,
  }) : super(key: key);

  @override
  _TextChangingAnimationState createState() => _TextChangingAnimationState();
}

class _TextChangingAnimationState extends State<TextChangingAnimation> {
  Widget child = const Center(
    child: Text('Hello'),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          child = const Center(
            child: Text('Loading...'),
          );
        });
      },
      child: AnimatedContainer(
        duration: widget.duration,
        //TODO update width and height attributes
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
        child: child,
      ),
    );
  }
}
