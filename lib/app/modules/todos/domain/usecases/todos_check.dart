import 'package:dartz/dartz.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

///
abstract class ITodosCheck
    with FutureUseCase<Either<Failure, Unit>, TodoCheck> {}

///
class TodosCheck implements ITodosCheck {
  final ITodosRepository repository;

  const TodosCheck(this.repository);

  @override
  Future<Either<Failure, Unit>> call(TodoCheck params) async {
    final todoOrFailure = await repository.read(params.uid);

    return await todoOrFailure.fold(
        (failure) => Left(failure),
        (todo) async => await repository.save(
              TodoEntity(
                uid: todo.uid,
                description: todo.description,
                done: params.checked,
              ),
            ));
  }
}
