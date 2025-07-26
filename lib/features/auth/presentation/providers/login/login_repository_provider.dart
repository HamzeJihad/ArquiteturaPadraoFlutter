import 'package:flutter_application_1/features/auth/data/datasources/login_datasource_impl.dart';
import 'package:flutter_application_1/features/auth/data/repositories/repositories.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/login_repository.dart';
import 'package:flutter_application_1/features/auth/presentation/factories/factories.dart';
import 'package:flutter_application_1/features/auth/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository_provider.g.dart';

@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepositoryImpl(LoginDatasourceImpl(ref.read(httpClientProvider), makeSecureStorageAdapter()));
}
