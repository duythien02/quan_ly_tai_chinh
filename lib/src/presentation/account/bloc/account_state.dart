part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class GetCurrenciesSuccess extends AccountState {
  const GetCurrenciesSuccess(this.currency);

  final Currency currency;

  @override
  List<Object> get props => [currency];
}

final class GetCurrenciesError extends AccountState {
  const GetCurrenciesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class CreateAccountSuccess extends AccountState {
  const CreateAccountSuccess(this.accountDocs);

  final AccountDocs accountDocs;

  @override
  List<Object> get props => [accountDocs];
}

final class CreateAccountError extends AccountState {
  const CreateAccountError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
