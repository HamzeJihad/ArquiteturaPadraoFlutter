import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.label, this.prefixIcon});

  final String label;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(label: CustomText(label), prefixIcon: prefixIcon, ),
    );
  }
}