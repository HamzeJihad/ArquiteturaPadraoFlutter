import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/auth/domain/datasources/datasources.dart';
import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/repositories.dart';

class VerifyStatusRepositoryImpl implements VerifyStatusRepository {
  final VerifyStatusDatasource datasource;

  VerifyStatusRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserEntity>> verify() {
    return datasource.verify();
  }
}
