import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';
import 'package:flutter_application_1/features/auth/presentation/providers/providers.dart';
import 'package:flutter_application_1/features/auth/presentation/ui/helpers/validators.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  final loginParams = AuthenticationParam(email: '', password: '');
  final _formKey = GlobalKey<FormState>();

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
                CustomText('Sign in Screen', fontSize: 45),
                CustomTextFormField(
                  label: 'E-mail',
                  prefixIcon: Icon(Icons.attach_email_outlined),
                  validator: emailValidator,

                  onSaved: (email) => loginParams.email = email ?? '',
                ),

                CustomTextFormField(
                  obscureText: true,
                  onSaved: (password) => loginParams.password = password ?? '',
                  label: 'Password',
                  prefixIcon: Icon(Icons.security_outlined),
                  validator: passwordValidator,
                ),

                FilledButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save(); //  Salva os valores digitados

                    ref.read(authenticationProviderProvider.notifier).login(loginParams);
                  },
                  child: ref.watch(authenticationProviderProvider).value!.isLoading
                      ? CircularProgressIndicator()
                      : const CustomText('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
