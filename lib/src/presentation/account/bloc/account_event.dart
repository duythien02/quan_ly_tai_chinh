part of 'account_bloc.dart';

@immutable
abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class CreateAccount extends AccountEvent {
  const CreateAccount(this.params);
  final CreateAccountRequestParams params;
}

class GetCurrencies extends AccountEvent {
  const GetCurrencies(this.params);
  final GetCurrenciesRequestParams params;
}
