import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';
import 'package:flutter_application_1/features/auth/presentation/providers/providers.dart';
import 'package:flutter_application_1/features/auth/presentation/ui/helpers/helpers.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final signupParams = RegisterParam(email: '', password: '', name: '', phone: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText('Sign up Screen', fontSize: 45),
                CustomTextFormField(
                  validator: nameValidator,
                  label: 'Fullname',
                  onSaved: (name) => signupParams.name = name ?? '',
                  prefixIcon: Icon(Icons.person_outline),
                ),

                CustomTextFormField(
                  validator: emailValidator,
                  label: 'E-mail',
                  prefixIcon: Icon(Icons.attach_email_outlined),
                  onSaved: (email) => signupParams.email = email ?? '',
                ),
                CustomTextFormField(validator: phoneValidator, label: 'Phone', prefixIcon: Icon(Icons.phone)),

                CustomTextFormField(
                  validator: (value) {
                    _formKey.currentState!.save();
                    confirmPasswordValidator(value, signupParams.password);
                    return null;
                  },

                  label: 'Password',
                  prefixIcon: Icon(Icons.security_outlined),
                  onSaved: (password) => signupParams.password = password ?? '',
                ),
                CustomTextFormField(
                  validator: passwordValidator,
                  label: 'Confirm Password',
                  prefixIcon: Icon(Icons.security_outlined),
                ),

                FilledButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();

                    ref.read(authenticationProviderProvider.notifier).register(signupParams);
                  },
                  child: ref.watch(authenticationProviderProvider).value!.isLoading
                      ? CircularProgressIndicator()
                      : const CustomText('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
