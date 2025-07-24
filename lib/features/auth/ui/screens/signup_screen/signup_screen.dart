import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText('Sign up Screen', fontSize: 45),
              CustomTextFormField(label: 'Fullname', prefixIcon: Icon(Icons.person_outline)),

              CustomTextFormField(label: 'E-mail', prefixIcon: Icon(Icons.attach_email_outlined)),
              CustomTextFormField(label: 'Phone', prefixIcon: Icon(Icons.phone)),

              CustomTextFormField(label: 'Password', prefixIcon: Icon(Icons.security_outlined)),
              CustomTextFormField(label: 'Confirm Password', prefixIcon: Icon(Icons.security_outlined)),

              FilledButton(onPressed: () {}, child: const CustomText('Sign up')),
            ],
          ),
        ),
      ),
    );
  }
}
