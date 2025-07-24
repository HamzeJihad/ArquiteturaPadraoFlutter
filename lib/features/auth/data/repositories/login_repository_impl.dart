import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/auth/domain/datasources/login_datasource.dart';
import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';
import '../../domain/helpers/authentication_param.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserEntity>> login(AuthenticationParam params) {
    return datasource.login(params);
  }
}
