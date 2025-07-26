import 'package:flutter_application_1/features/auth/data/datasources/register_datasource_impl.dart';
import 'package:flutter_application_1/features/auth/data/repositories/repositories.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/register_repository.dart';
import 'package:flutter_application_1/features/auth/presentation/factories/factories.dart';
import 'package:flutter_application_1/features/auth/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_repository_provider.g.dart';

@riverpod
RegisterRepository registerRepository(Ref ref) {
  return RegisterRepositoryImpl(
    RegisterDatasourceImpl(
      httpClient: ref.read(httpClientProvider),
      secureStorageAdapter: makeSecureStorageAdapter(),
    ),
  );
}
