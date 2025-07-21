// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../core/bloc/ez_bloc.dart';
import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';
import '../../../domain/usecases/auth/save_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._registerUseCase,
    this._saveAuthUseCase,
    this._loginUsecase,
  ) : super(AuthInitial()) {
    on<AuthRegisterRequested>(onRegisterRequested);
    on<AuthLoginRequested>(onLoginRequested);
  }

  final RegisterUseCase _registerUseCase;
  final LoginUsecase _loginUsecase;
  final SaveUserUseCase _saveAuthUseCase;

  Future<void> onRegisterRequested(
    final AuthRegisterRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final dataState = await _registerUseCase(
      params: event.params,
    );

    if (dataState is DataSuccess && dataState.data != null) {
      await _saveAuthUseCase(
        params: dataState.data!,
      );
      emit(AuthRegisterSuccess(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(AuthError(dataState.error?.message ?? 'Unknown error'));
    }
  }

  Future<void> onLoginRequested(
    final AuthLoginRequested event,
    final Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final dataState = await _loginUsecase(
      params: event.params,
    );

    if (dataState is DataSuccess && dataState.data != null) {
      await _saveAuthUseCase(
        params: dataState.data!,
      );

      emit(AuthLoginSuccess(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(AuthError(dataState.error?.message ?? 'Unknown error'));
    }
  }
}
