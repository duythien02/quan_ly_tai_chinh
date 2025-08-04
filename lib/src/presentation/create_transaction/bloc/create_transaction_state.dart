part of 'create_transaction_bloc.dart';

class CreateTransactionState extends Equatable {
  const CreateTransactionState();

  @override
  List<Object> get props => [];
}

final class CreateTransactionInitial extends CreateTransactionState {}

final class CreateTransactionLoading extends CreateTransactionState {}

final class GetCategoriesSuccess extends CreateTransactionState {
  const GetCategoriesSuccess(this.categories);

  final Category categories;

  @override
  List<Object> get props => [categories];
}

final class GetCategoriesError extends CreateTransactionState {
  const GetCategoriesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class GetAccountsSuccess extends CreateTransactionState {
  const GetAccountsSuccess({required this.accounts});

  final List<AccountDocs> accounts;

  @override
  List<Object> get props => [accounts];
}

final class GetAccountsFailure extends CreateTransactionState {
  const GetAccountsFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class CreateTransactionSuccess extends CreateTransactionState {
  const CreateTransactionSuccess();

  @override
  List<Object> get props => [];
}

final class CreateTransactionFailure extends CreateTransactionState {
  const CreateTransactionFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
