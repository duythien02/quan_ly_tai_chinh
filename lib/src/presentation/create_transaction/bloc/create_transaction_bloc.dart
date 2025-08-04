import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/account/get_accounts_usecase.dart';
import '../../../domain/usecases/category/get_categories_usecase.dart';
import '../../../domain/usecases/transaction/create_transaction_usecase.dart';
part 'create_transaction_event.dart';
part 'create_transaction_state.dart';

@injectable
class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  CreateTransactionBloc(
    this._getCategoriesUsecase,
    this._getAccountsUsecase,
    this._createTransactionUsecase,
  ) : super(CreateTransactionLoading()) {
    on<GetCategories>(_onGetCategories);
    on<GetAccounts>(_onGetAccounts);
    on<CreateTransaction>(_onCreateTransaction);
  }

  final GetCategoriesUsecase _getCategoriesUsecase;
  final GetAccountsUsecase _getAccountsUsecase;
  final CreateTransactionUsecase _createTransactionUsecase;

  Future<void> _onGetCategories(
    final GetCategories event,
    final Emitter<CreateTransactionState> emit,
  ) async {
    emit(CreateTransactionLoading());
    final dateState = await _getCategoriesUsecase(
      params: event.params,
    );
    if (dateState is DataSuccess && dateState.data != null) {
      emit(GetCategoriesSuccess(dateState.data!));
    }
    if (dateState is DataFailure) {
      emit(GetCategoriesError(dateState.error?.message ?? ''));
    }
  }

  Future<void> _onGetAccounts(
    final GetAccounts event,
    final Emitter<CreateTransactionState> emit,
  ) async {
    emit(CreateTransactionLoading());
    final dateState = await _getAccountsUsecase(params: event.params);
    if (dateState is DataSuccess && dateState.data != null) {
      emit(
        GetAccountsSuccess(
          accounts: dateState.data!.items.map((final e) => e!).toList(),
        ),
      );
    }
    if (dateState is DataFailure) {
      emit(GetAccountsFailure(dateState.error?.message ?? ''));
    }
  }

  Future<void> _onCreateTransaction(
    final CreateTransaction event,
    final Emitter<CreateTransactionState> emit,
  ) async {
    emit(CreateTransactionLoading());
    final dateState = await _createTransactionUsecase(params: event.params);
    if (dateState is DataSuccess) {
      emit(const CreateTransactionSuccess());
    }
    if (dateState is DataFailure) {
      emit(CreateTransactionFailure(dateState.error?.message ?? ''));
    }
  }
}
