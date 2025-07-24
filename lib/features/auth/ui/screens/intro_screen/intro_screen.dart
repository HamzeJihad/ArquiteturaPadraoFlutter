import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/configs.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
              CustomText('Intro Screen', fontSize: 45),
              CustomTextFormField(label: 'E-mail', prefixIcon: Icon(Icons.attach_email_outlined)),

              CustomTextFormField(label: 'Password', prefixIcon: Icon(Icons.security_outlined)),

              FilledButton(onPressed: () {}, child: const CustomText('Sign in')),
              TextButton(
                onPressed: () {
                  context.push(signUpScreen);
                },
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
