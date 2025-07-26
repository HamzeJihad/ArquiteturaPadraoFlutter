import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/register_repository.dart';

import '../../../../core/core.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(RegisterParam params) {
    return repository.register(params);
  }
}
