import '../../core/params/params.dart';
import '../../core/resources/data_state.dart';
import '../entities/entities.dart';

abstract class AccountRepository {
  Future<DataState<Account?>> getAccounts(
    final GetAccountsRequestParams params,
  );
  Future<DataState<AccountDocs?>> createAccount(
    final CreateAccountRequestParams params,
  );
  Future<DataState<Currency?>> getCurrencies(
    final GetCurrenciesRequestParams params,
  );
}
