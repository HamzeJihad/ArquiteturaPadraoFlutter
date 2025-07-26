import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/auth/data/infrastructure/mappers/use_mapper.dart';
import 'package:flutter_application_1/features/auth/domain/datasources/login_datasource.dart';
import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';
import 'package:flutter_application_1/features/shared/infrastruture/cache/secure_storage_adapter.dart';

import '../infrastructure/user_response/user_response_api.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final HttpClient _httpClient;
  final SecureStorageAdapter _secureStorageAdapter;

  LoginDatasourceImpl(this._httpClient, this._secureStorageAdapter);

  @override
  Future<Either<Failure, UserEntity>> login(AuthenticationParam params) {
    return _httpClient.post(
      url: '/auth/login',
      body: RemoteAuthenticationParams.fromDomain(params).toMap(),
      fromJson: (json) async {
        final result = UserResponseApi.fromJson(json).data;
        _secureStorageAdapter.save(key: 'token', value: result.token);
        return UseMapper.userModelToEntity(result.user);
      },
    );
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({required this.email, required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParam params) {
    return RemoteAuthenticationParams(email: params.email, password: params.password);
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}
