import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/jobs/data/infrastructure/infrastructure.dart';
import 'package:flutter_application_1/features/jobs/domain/datasource/datasource.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';

import '../../../shared/infrastruture/cache/secure_storage_adapter.dart';

class GetDetailsAdvertisementJobDatasourceImpl implements GetDetailsAdvertisementJobDatasource {
  final HttpClient _httpClient;
  final SecureStorageAdapter _secureStorageAdapter;

  GetDetailsAdvertisementJobDatasourceImpl(this._httpClient, this._secureStorageAdapter);

  @override
  Future<Either<Failure,AdvertisementJobEntity>> getDetailsAdvertisement(String idAdvertisement)async {
    final token = await _secureStorageAdapter.fetch(key: 'token');

    return _httpClient.get(
      url: '/advertisement-jobs/$idAdvertisement',
      headers: {
        'Authorization': 'Bearer $token',
      },
      fromJson: (json) {
        
        final result = DetailsAdvertisementResponseApi.fromJson(json).data;
        return AdvertisementMapper.advertisementModelToEntity(result);
      }
    );
  }
}
