import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/configs.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Center(child: CustomText('Intro Screen', fontSize: 45))),

            FilledButton.icon(
              icon: Icon(Icons.add_circle_outline_outlined),
              label: CustomText('Create an account'),
              onPressed: () {
                context.push(signUpScreen);
              },
            ),
            TextButton(
              onPressed: () {
                context.push(signInScreen);
              },
              child: Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}

