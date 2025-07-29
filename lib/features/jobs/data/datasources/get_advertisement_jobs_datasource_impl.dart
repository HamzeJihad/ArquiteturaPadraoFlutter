import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/jobs/data/infrastructure/infrastructure.dart';
import 'package:flutter_application_1/features/jobs/domain/datasource/datasource.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';

import '../../../shared/infrastruture/cache/secure_storage_adapter.dart';

class GetAdvertisementJobsDatasourceImpl implements GetAdvertisementJobsDatasource {
  final HttpClient _httpClient;
  final SecureStorageAdapter _secureStorageAdapter;

  GetAdvertisementJobsDatasourceImpl(this._httpClient, this._secureStorageAdapter);

  @override
  Future<Either<Failure, List<AdvertisementJobEntity>>> getAdvertisementJobs()async {
        final token = await _secureStorageAdapter.fetch(key: 'token');

    return _httpClient.get(
      url: '/advertisement-jobs',
      headers: {
        'Authorization': 'Bearer $token',
      },
      fromJson: (json) => AdvertisementResponseApi.fromJson(json).data
          .map((e) => AdvertisementMapper.advertisementModelToEntity(e))
          .toList(),
    );
  }
}
