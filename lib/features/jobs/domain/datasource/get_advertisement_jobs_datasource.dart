import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';

abstract class GetAdvertisementJobsDatasource {
  Future<Either<Failure, List<AdvertisementJobEntity>>> getAdvertisementJobs();
}
