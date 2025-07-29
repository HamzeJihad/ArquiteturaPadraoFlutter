import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';
import 'package:flutter_application_1/features/jobs/domain/repositories/repositories.dart';

class GetAdvertisementJobsUsecase {
  final GetAdvertisementJobsRepository repository;

  GetAdvertisementJobsUsecase(this.repository);
  Future<Either<Failure, List<AdvertisementJobEntity>>> call() {
    return repository.getAdvertisementJobs();
  }
}
