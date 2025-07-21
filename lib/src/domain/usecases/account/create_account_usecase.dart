// Package imports:
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/account_repository.dart';

@injectable
class CreateAccountUsecase
    implements UseCase<DataState<AccountDocs?>, CreateAccountRequestParams> {
  CreateAccountUsecase(this._accountRepository);

  final AccountRepository _accountRepository;

  @override
  Future<DataState<AccountDocs?>> call({
    required final CreateAccountRequestParams params,
  }) {
    return _accountRepository.createAccount(params);
  }
}
