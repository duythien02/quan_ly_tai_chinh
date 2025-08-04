import '../../core/params/params.dart';
import '../../core/resources/data_state.dart';
import '../../domain/entities/entities.dart';

abstract class TransactionRepository {
  Future<DataState<TransactionSummary?>> getTransactionSummary(
    final GetTransactionSummaryRequestParams params,
  );

  Future<DataState<void>> createTransaction(
    final CreateTransactionRequestParams params,
  );
}
