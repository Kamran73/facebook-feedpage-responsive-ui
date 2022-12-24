import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatButtonIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const FlatButtonIcon({Key? key, required this.icon, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 25.0,),
        const SizedBox(width: 5.0,),
        Text(title, style: const TextStyle(fontSize: 16,),),
      ],
    );
  }
}
