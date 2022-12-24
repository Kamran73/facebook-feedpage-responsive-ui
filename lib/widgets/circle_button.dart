import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.iconData, required this.size, required this.onPressed}) : super(key: key);
  final onPressed;
  final IconData iconData;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: IconButton(
        onPressed: onPressed,
        iconSize: size,
        color: Colors.black,
        icon: Icon(iconData),
      ),
    );
  }
}
