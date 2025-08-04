part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class GetAccountsSuccess extends HomeState {
  const GetAccountsSuccess({required this.accounts});

  final List<AccountDocs> accounts;

  @override
  List<Object> get props => [accounts];
}

final class GetAccountsFailure extends HomeState {
  const GetAccountsFailure({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}

final class GetTransactionSummarySuccess extends HomeState {
  const GetTransactionSummarySuccess(this.transactionSummary);

  final TransactionSummary transactionSummary;

  @override
  List<Object> get props => [transactionSummary];
}

final class GetTransactionSummaryFailure extends HomeState {
  const GetTransactionSummaryFailure({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
