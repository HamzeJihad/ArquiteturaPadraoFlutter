import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/failure.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';
import 'package:flutter_application_1/features/jobs/domain/repositories/repositories.dart';

class GetDetailsAdvertisementJobUsecase {
  final GetDetailsAdvertisementJobRepository repository;
  final String idAdvertisement;
  GetDetailsAdvertisementJobUsecase(this.repository, this.idAdvertisement);
  Future<Either<Failure, AdvertisementJobEntity>> call() {
    return repository.getDetailsAdvertisement(idAdvertisement);
  }
}
