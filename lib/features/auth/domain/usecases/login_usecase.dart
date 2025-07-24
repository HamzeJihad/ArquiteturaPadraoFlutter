import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/login_repository.dart';

import '../../../../core/core.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call(AuthenticationParam params) {
    return repository.login(params);
  }
}
