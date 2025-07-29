import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';
import 'package:flutter_application_1/features/jobs/domain/usecases/usecases.dart';
import 'package:flutter_application_1/features/jobs/presentation/providers/advertisement_jobs/get_advertisement_jobs_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'advertisement_job_provider.g.dart';

class AdvertisementJobState {
  Failure? errorMessage;
  bool isLoading;
  List<AdvertisementJobEntity>? advertisementJobs;

  AdvertisementJobState({this.errorMessage, this.isLoading = false, this.advertisementJobs});

  AdvertisementJobState copyWith({
    Failure? errorMessage,
    bool? isLoading,
    List<AdvertisementJobEntity>? advertisementJobs,
  }) {
    return AdvertisementJobState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      advertisementJobs: advertisementJobs ?? this.advertisementJobs,
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
}
