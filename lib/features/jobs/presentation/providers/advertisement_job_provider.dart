import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';
import 'package:flutter_application_1/features/jobs/domain/usecases/usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

part 'advertisement_job_provider.g.dart';

class AdvertisementJobState {
  Failure? errorMessage;
  bool isLoading;
  List<AdvertisementJobEntity>? advertisementJobs;
  AdvertisementJobEntity? detailsAdvertisementJobs;

  AdvertisementJobState({
    this.errorMessage,
    this.isLoading = false,
    this.advertisementJobs,
    this.detailsAdvertisementJobs,
  });

  AdvertisementJobState copyWith({
    Failure? errorMessage,
    bool? isLoading,
    List<AdvertisementJobEntity>? advertisementJobs,
    AdvertisementJobEntity? detailsAdvertisementJobs,
  }) {
    return AdvertisementJobState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      advertisementJobs: advertisementJobs ?? this.advertisementJobs,
      detailsAdvertisementJobs: detailsAdvertisementJobs ?? this.detailsAdvertisementJobs,
    );
  }
}

@Riverpod(keepAlive: true)
class AdvertisementJobProvider extends _$AdvertisementJobProvider {
  @override
  FutureOr<AdvertisementJobState> build() => AdvertisementJobState();

  Future<void> getAdvertisementJobs() async {
    state = const AsyncLoading();
    final useCase = GetAdvertisementJobsUsecase(ref.read(getAdvertisementJobsRepositoryProvider));

    final result = await useCase();

    result.fold(
      (failure) {
        state = AsyncData(state.value!.copyWith(errorMessage: failure, isLoading: false));
      },
      (jobs) {
        state = AsyncData(
          state.value!.copyWith(advertisementJobs: jobs, isLoading: false, errorMessage: null),
        );
      },
    );
  }

  Future<void> getDetailsAdvertisementJob(String refJob) async {
    state = const AsyncLoading();
    final useCase = GetDetailsAdvertisementJobUsecase(
      ref.read(getDetailsAdvertisementJosRepositoryProvider),
      refJob,
    );

    final result = await useCase();

    result.fold(
      (failure) {
        state = AsyncData(state.value!.copyWith(errorMessage: failure, isLoading: false));
      },
      (jobs) {
        state = AsyncData(
          state.value!.copyWith(detailsAdvertisementJobs: jobs, isLoading: false, errorMessage: null),
        );
      },
    );
  }
}
