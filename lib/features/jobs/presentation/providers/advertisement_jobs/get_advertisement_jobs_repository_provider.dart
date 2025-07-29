
import 'package:flutter_application_1/features/auth/presentation/factories/factories.dart';
import 'package:flutter_application_1/features/jobs/data/datasources/datasources.dart';
import 'package:flutter_application_1/features/jobs/domain/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../auth/presentation/providers/providers.dart';
import '../../../data/repositories/repositories.dart';

part 'get_advertisement_jobs_repository_provider.g.dart';

@riverpod
GetAdvertisementJobsRepository getAdvertisementJobsRepository (Ref ref) {
  return GetAdvertisementJobsRepositoryImpl(GetAdvertisementJobsDatasourceImpl(ref.read(httpClientProvider), makeSecureStorageAdapter()));
}


