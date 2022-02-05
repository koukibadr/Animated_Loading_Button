import 'package:flutter/material.dart';

class ProgressIndicatorAnimation<T> extends StatefulWidget {


  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget buttonChild;
  final Color color;

  const ProgressIndicatorAnimation({
    Key? key,
    required this.duration,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    required this.color,
  }) : super(key: key);

  @override
  _ProgressIndicatorAnimationState createState() => _ProgressIndicatorAnimationState();
}

class _ProgressIndicatorAnimationState extends State<ProgressIndicatorAnimation> {
  
  double? progressValue = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          progressValue = null;
        });
      },
      child: Container(
          //TODO update width and height attributes
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10),
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
          child: Column(
            children: [
              Expanded(
                child: widget.buttonChild,
              ),
              LinearProgressIndicator(
                value: progressValue,
              )
            ],
          ),
        ),
    );
  }
}