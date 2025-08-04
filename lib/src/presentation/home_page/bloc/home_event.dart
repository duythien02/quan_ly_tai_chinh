part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAccountsEvent extends HomeEvent {
  const GetAccountsEvent(this.params);

  final GetAccountsRequestParams params;
}

class GetTransactionSummaryEvent extends HomeEvent {
  const GetTransactionSummaryEvent(this.params);

  final GetTransactionSummaryRequestParams params;
}
