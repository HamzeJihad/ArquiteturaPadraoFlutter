import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract class RegisterDatasource {
  Future<Either<Failure, UserEntity>> register(RegisterParam params);

}
