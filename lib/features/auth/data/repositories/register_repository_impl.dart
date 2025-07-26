import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/auth/domain/datasources/register_datasource.dart';
import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDatasource datasource;

  RegisterRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserEntity>> register(RegisterParam params) {
    return datasource.register(params);
  }
}
