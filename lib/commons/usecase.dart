abstract interface class UseCase<T, NoParams> {
  Future<T> call(params);
}

class NoParams {}
