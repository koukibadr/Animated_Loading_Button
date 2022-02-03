import 'dart:async';

import 'package:animated_loading_button/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ColorChangingAnimation<T> extends StatefulWidget {
  final Duration duration;
  final Future<T> Function() onPress;
  final Function(T) onAsyncCallFinished;
  final Widget buttonChild;
  final List<Color> colors;

  const ColorChangingAnimation({
    Key? key,
    required this.duration,
    required this.onPress,
    required this.onAsyncCallFinished,
    required this.buttonChild,
    required this.colors,
  }) : super(key: key);

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
      onTap: (){
        Timer.periodic(widget.duration, (timer) { 
          if(selectedColorIndex < widget.colors.length -1){
            selectedColorIndex++;
          }else{
            selectedColorIndex = 0;
          }
          setState(() {
            selectedColor = widget.colors[selectedColorIndex];
          });
        });
      },
      child: ButtonWidget(
        background: selectedColor,
        child: widget.buttonChild,
      ),
    );
  }
}
