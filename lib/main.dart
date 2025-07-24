import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/configs.dart';
import 'package:flutter_application_1/features/auth/data/datasources/login_datasource_impl.dart';
import 'package:flutter_application_1/features/auth/data/repositories/repositories.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/authentication_param.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/features/shared/infrastruture/infra.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Environment.initEnvironment();
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );
  final httpClient = HttpClientImpl(dio: dio);
  final remoteDataSource = LoginDatasourceImpl(httpClient);
  final repository = LoginRepositoryImpl(remoteDataSource);
  final useCase = LoginUsecase(repository);

  final result = await useCase(AuthenticationParam(email: 'hamze.user@gmail.com', password: '12345677712'));

  result.fold(
    (failure) => log('falha ao logar: ${failure.message}'),
    (user) => log('logado com sucesso: ${user.name}'),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router, title: 'Flutter Demo', theme: AppTheme().getTheme(true));
  }
}
