import 'package:flutter_application_1/features/auth/data/datasources/datasources.dart';
import 'package:flutter_application_1/features/auth/data/repositories/repositories.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/repositories.dart';
import 'package:flutter_application_1/features/auth/presentation/factories/factories.dart';
import 'package:flutter_application_1/features/auth/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_status_repository_provider.g.dart';

@riverpod
VerifyStatusRepository verifyStatusRepository(Ref ref) {
  return VerifyStatusRepositoryImpl(VerifyStatusDatasourceImpl(ref.read(httpClientProvider), makeSecureStorageAdapter()));
}
