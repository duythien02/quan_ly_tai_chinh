import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/bloc/ez_bloc.dart';
import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/account/get_accounts_usecase.dart';
import '../../../domain/usecases/transaction/get_transaction_summary_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.getAccountsUsecase,
    this.getTransactionSummaryUsecase,
  ) : super(HomeLoading()) {
    on<GetAccountsEvent>(_onGetAccountsEvent);
    on<GetTransactionSummaryEvent>(_onGetTransactionSummaryEvent);
    add(GetAccountsEvent(GetAccountsRequestParams()));
  }

  final GetAccountsUsecase getAccountsUsecase;
  final GetTransactionSummaryUsecase getTransactionSummaryUsecase;

  Future<void> _onGetAccountsEvent(
    final GetAccountsEvent event,
    final Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 2));
    final dataState = await getAccountsUsecase(
      params: event.params,
    );
    if (dataState is DataSuccess && dataState.data != null) {
      emit(
        GetAccountsSuccess(
          accounts: dataState.data?.items.map((final e) => e!).toList() ?? [],
        ),
      );
    } else {
      emit(
        GetAccountsFailure(
          error: dataState.error?.message ?? 'Unknown error',
        ),
      );
    }
  }

  Future<void> _onGetTransactionSummaryEvent(
    final GetTransactionSummaryEvent event,
    final Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final dataState = await getTransactionSummaryUsecase(
      params: event.params,
    );
    if (dataState is DataSuccess && dataState.data != null) {
      emit(GetTransactionSummarySuccess(dataState.data!));
    } else {
      emit(
        GetTransactionSummaryFailure(
          error: dataState.error?.message ?? 'Unknown error',
        ),
      );
    }
  }
}
