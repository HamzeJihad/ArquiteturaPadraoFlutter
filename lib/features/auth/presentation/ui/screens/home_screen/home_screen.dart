import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: CustomText('Sucesso ao logar'),
      ),
    );
  }
}