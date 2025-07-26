import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/repositories.dart';

import '../../../../core/core.dart';

class VerifyStatusUsecase {
  final VerifyStatusRepository repository;

  VerifyStatusUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call() {
    return repository.verify();
  }
}
