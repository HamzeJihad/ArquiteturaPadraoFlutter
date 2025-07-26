import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/auth/data/infrastructure/mappers/use_mapper.dart';
import 'package:flutter_application_1/features/auth/domain/datasources/datasources.dart';
import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:flutter_application_1/features/shared/infrastruture/cache/secure_storage_adapter.dart';

import '../infrastructure/user_response/user_response_api.dart';

class VerifyStatusDatasourceImpl implements VerifyStatusDatasource {
  final HttpClient _httpClient;
  final SecureStorageAdapter _secureStorageAdapter;

  VerifyStatusDatasourceImpl(this._httpClient, this._secureStorageAdapter);

  @override
  Future<Either<Failure, UserEntity>> verify()async {
    final token = await _secureStorageAdapter.fetch(key: 'token');
    return _httpClient.get(
      url: '/auth/check-status',
      headers: {
        'Authorization': 'Bearer $token',
      },
      fromJson: (json)  {
        final result = UserResponseApi.fromJson(json).data;
        return UseMapper.userModelToEntity(result.user);
      },
    );
  }
}

