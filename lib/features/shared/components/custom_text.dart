import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key, this.fontSize = 14, this.color});
  final String text;
  final double fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}
