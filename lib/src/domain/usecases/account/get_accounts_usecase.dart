// Package imports:
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/account_repository.dart';

@injectable
class GetAccountsUsecase
    implements UseCase<DataState<Account?>, GetAccountsRequestParams> {
  GetAccountsUsecase(this._accountRepository);

  final AccountRepository _accountRepository;

  @override
  Future<DataState<Account?>> call({
    required final GetAccountsRequestParams params,
  }) {
    return _accountRepository.getAccounts(params);
  }
}
