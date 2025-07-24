import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),

              CustomText('Signin Screen', fontSize: 45),
              Spacer(),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline),
                label: const Text('Create an account'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(onPressed: () {}, child: Text('Sign in')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
