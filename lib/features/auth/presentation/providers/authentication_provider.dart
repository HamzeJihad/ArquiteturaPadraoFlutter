import 'package:flutter_application_1/configs/configs.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/auth/domain/entities/entities.dart';
import 'package:flutter_application_1/features/auth/domain/helpers/helpers.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/usecases.dart';
import 'package:flutter_application_1/features/auth/presentation/providers/providers.dart';
import 'package:flutter_application_1/features/auth/presentation/ui/helpers/messages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

enum AuthStatus { checking, authenticated, unauthenticated }

class AuthenticationState {
  AuthStatus status;
  Failure? errorMessage;
  bool isLoading;
  UserEntity? userEntity;

  AuthenticationState({
    this.status = AuthStatus.checking,
    this.errorMessage,
    this.isLoading = false,
    this.userEntity,
  });

  AuthenticationState copyWith({
    AuthStatus? status,
    Failure? errorMessage,
    bool? isLoading,
    UserEntity? userEntity,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}

@Riverpod(keepAlive: true)
class AuthenticationProvider extends _$AuthenticationProvider {
  @override
  FutureOr<AuthenticationState> build() => AuthenticationState();

  Future<void> login(AuthenticationParam params) async {
    state = AsyncData(state.value!.copyWith(isLoading: true));
    final loginUseCase = LoginUsecase(ref.read(loginRepositoryProvider));

    final result = await loginUseCase(params);
    result.fold(
      (failure) {
        MessagesService.showCustomSnackBar('Falha ao logar ${failure.message}', error: true);
        _setAuthStatusWhenError(failure);
      },
      (user) {
        _setAuthStatusWhenSuccess(user);
        ref.read(appRouterProvider).push(homeScreen);
      },
    );

    state = AsyncData(state.value!.copyWith(isLoading: false));
  }

  Future<void> register(RegisterParam params) async {
    state = AsyncData(state.value!.copyWith(isLoading: true));
    final registerUseCase = RegisterUseCase(ref.read(registerRepositoryProvider));

    final result = await registerUseCase(params);
    result.fold(
      (failure) {
        MessagesService.showCustomSnackBar('Falha ao registrar ${failure.message}', error: true);
        _setAuthStatusWhenError(failure);
      },
      (user) {
        _setAuthStatusWhenSuccess(user);
        ref.read(appRouterProvider).push(signInScreen);
      },
    );

    state = AsyncData(state.value!.copyWith(isLoading: false));
  }

  Future<void> verifyStatus() async {
    state = AsyncData(state.value!.copyWith(status: AuthStatus.checking, isLoading: true));
    final verifyStatusUsecase = VerifyStatusUsecase(ref.read(verifyStatusRepositoryProvider));

    final result = await verifyStatusUsecase();
    result.fold(
      (failure) {

        _setAuthStatusWhenError(failure);
        ref.read(appRouterProvider).push(signInScreen);
      },
      (user) {
        _setAuthStatusWhenSuccess(user);
        ref.read(appRouterProvider).push(homeScreen);
      },
    );
  }

  void _setAuthStatusWhenSuccess(UserEntity user) {
    state = AsyncData(
      state.value!.copyWith(
        status: AuthStatus.authenticated,
        userEntity: user,
        isLoading: false,
        errorMessage: null,
      ),
    );
  }

  void _setAuthStatusWhenError(Failure failure) {
    state = AsyncData(
      state.value!.copyWith(
        status: AuthStatus.unauthenticated,
        userEntity: null,
        isLoading: false,
        errorMessage: failure,
      ),
    );
  }
}
