///
mixin FutureUseCase<Type, Params> {
  ///
  Future<Type> call(Params params);
}

///
mixin StreamUseCase<Type, Params> {
  ///
  Stream<Type> call(Params params);
}
