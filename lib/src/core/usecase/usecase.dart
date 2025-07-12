abstract class UseCase<T, P> {
  Future<T> call({required final P params});
}

abstract class UseCaseWithIdAndParam<T, P1, P2> {
  Future<T> call({required final P1 id, required final P2 params});
}

abstract class UseCaseWithParam<T, P2> {
  Future<T> call({required final P2 params});
}

abstract class UseCaseWithId<T, P1> {
  Future<T> call({required final P1 id});
}
