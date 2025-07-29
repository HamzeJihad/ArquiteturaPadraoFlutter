
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';

class CustomTextWithBackground extends StatelessWidget {
  const CustomTextWithBackground(this.text, {super.key, this.backgroundColor});
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xff2d2f32),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomText(text, fontSize: 12),
    );
  }
}
