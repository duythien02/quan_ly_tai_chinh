import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/account/create_account_usecase.dart';
import '../../../domain/usecases/account/get_currencies_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(
    this._createAccountUsecase,
    this._getCurrenciesUsecase,
  ) : super(AccountInitial()) {
    on<CreateAccount>(onCreateAccount);
    on<GetCurrencies>(onGetCurrencies);
  }

  final CreateAccountUsecase _createAccountUsecase;
  final GetCurrenciesUsecase _getCurrenciesUsecase;

  Future<void> onCreateAccount(
    final CreateAccount event,
    final Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final dataState = await _createAccountUsecase(params: event.params);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(CreateAccountSuccess(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(CreateAccountError(dataState.error?.message ?? 'Unknown error'));
    }
  }

  Future<void> onGetCurrencies(
    final GetCurrencies event,
    final Emitter<AccountState> emit,
  ) async {
    emit(AccountLoading());

    final dataState = await _getCurrenciesUsecase(params: event.params);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(GetCurrenciesSuccess(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(GetCurrenciesError(dataState.error?.message ?? 'Unknown error'));
    }
  }
}
