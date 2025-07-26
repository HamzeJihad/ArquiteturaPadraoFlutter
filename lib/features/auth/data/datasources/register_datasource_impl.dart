import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/auth/data/infrastructure/mappers/use_mapper.dart';
import 'package:flutter_application_1/features/auth/domain/datasources/register_datasource.dart';
import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';
import 'package:flutter_application_1/features/shared/infrastruture/cache/secure_storage_adapter.dart';

import '../infrastructure/user_response/user_response_api.dart';

class RegisterDatasourceImpl implements RegisterDatasource {
  final HttpClient _httpClient;
  final SecureStorageAdapter _secureStorageAdapter;

  RegisterDatasourceImpl({required HttpClient httpClient, required SecureStorageAdapter secureStorageAdapter}) : _httpClient = httpClient, _secureStorageAdapter = secureStorageAdapter;


  @override
  Future<Either<Failure, UserEntity>> register(RegisterParam params) {
    return _httpClient.post(
      url: '/auth/register',
      body: RemoteRegisterParams.fromDomain(params).toMap(),
      fromJson: (json) async => UseMapper.userModelToEntity(UserResponseApi.fromJson(json).data.user),
    );
  }
}

class RemoteRegisterParams {
  final String email;
  final String password;
  final String phone;
  final String name;

  RemoteRegisterParams({
    required this.phone,
    required this.name,
    required this.email,
    required this.password,
  });

  factory RemoteRegisterParams.fromDomain(RegisterParam params) {
    return RemoteRegisterParams(
      email: params.email,
      password: params.password,

      phone: params.phone,
      name: params.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password, 'phone': phone, 'name': name};
  }
}
