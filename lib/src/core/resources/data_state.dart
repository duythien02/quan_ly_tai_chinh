// Project imports:
import '../error/api_error.dart';

abstract class DataState<T> {
  const DataState({this.data, this.error});

  final ApiError? error;
  final T? data;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(final T? data) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure(final ApiError? error) : super(error: error);
}
