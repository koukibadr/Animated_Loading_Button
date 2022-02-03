import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  

  const ButtonWidget({
    Key? key,
    required this.child,
    required this.background,
  }) : super(key: key);

  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO update width and height attributes
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: background,
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
    );
  }
}
