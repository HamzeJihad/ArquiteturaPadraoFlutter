import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract class VerifyStatusDatasource {
  Future<Either<Failure, UserEntity>> verify( );

}
