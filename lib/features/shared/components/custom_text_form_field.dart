import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.label, this.prefixIcon, this.onSaved, this.validator});

  final String label;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved:onSaved ,
      decoration: InputDecoration(label: CustomText(label), prefixIcon: prefixIcon, ),
    );
  }
}