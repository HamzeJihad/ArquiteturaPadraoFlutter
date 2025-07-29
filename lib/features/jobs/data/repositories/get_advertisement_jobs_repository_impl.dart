import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/advertisement_job_entity.dart';
import 'package:flutter_application_1/features/jobs/domain/repositories/repositories.dart';

import '../../domain/datasource/datasource.dart';

class GetAdvertisementJobsRepositoryImpl  implements GetAdvertisementJobsRepository {

 final GetAdvertisementJobsDatasource datasource;

  GetAdvertisementJobsRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<AdvertisementJobEntity>>> getAdvertisementJobs() {
    return datasource.getAdvertisementJobs();
  }
}