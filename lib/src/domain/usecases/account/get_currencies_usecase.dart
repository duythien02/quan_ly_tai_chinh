// Package imports:
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/account_repository.dart';

@injectable
class GetCurrenciesUsecase
    implements UseCase<DataState<Currency?>, GetCurrenciesRequestParams> {
  GetCurrenciesUsecase(this._accountRepository);

  final AccountRepository _accountRepository;

  @override
  Future<DataState<Currency?>> call({
    required final GetCurrenciesRequestParams params,
  }) {
    return _accountRepository.getCurrencies(params);
  }
}
