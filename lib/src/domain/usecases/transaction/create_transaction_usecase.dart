import 'package:injectable/injectable.dart';

import '../../../core/params/params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/transaction_repository.dart';

@injectable
class CreateTransactionUsecase
    implements UseCase<DataState<void>, CreateTransactionRequestParams> {
  CreateTransactionUsecase(this._transactionRepository);
  final TransactionRepository _transactionRepository;

  @override
  Future<DataState<void>> call({
    required final CreateTransactionRequestParams params,
  }) {
    return _transactionRepository.createTransaction(params);
  }
}
