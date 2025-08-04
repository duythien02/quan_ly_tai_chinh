part of 'create_transaction_bloc.dart';

class CreateTransactionEvent extends Equatable {
  const CreateTransactionEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends CreateTransactionEvent {
  const GetCategories(this.params);

  final GetCategoriesRequestParams params;
}

class GetAccounts extends CreateTransactionEvent {
  const GetAccounts(this.params);

  final GetAccountsRequestParams params;
}

class CreateTransaction extends CreateTransactionEvent {
  const CreateTransaction(this.params);

  final CreateTransactionRequestParams params;
}
