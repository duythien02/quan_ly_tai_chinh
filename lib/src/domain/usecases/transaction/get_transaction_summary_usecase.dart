// Package imports:
import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entities.dart';
import '../../repositories/transaction_repository.dart';

@injectable
class GetTransactionSummaryUsecase
    implements
        UseCase<DataState<TransactionSummary?>,
            GetTransactionSummaryRequestParams> {
  GetTransactionSummaryUsecase(this._transactionRepository);

  final TransactionRepository _transactionRepository;

  @override
  Future<DataState<TransactionSummary?>> call({
    required final GetTransactionSummaryRequestParams params,
  }) {
    return _transactionRepository.getTransactionSummary(params);
  }
}
