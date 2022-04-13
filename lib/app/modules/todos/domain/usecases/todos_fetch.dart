import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

///
abstract class ITodosFetch with StreamUseCase<List<TodoEntity>, TodoFilter> {}

///
class TodosFetch implements ITodosFetch {
  final ITodosRepository repository;

  const TodosFetch(this.repository);

  @override
  Stream<List<TodoEntity>> call(TodoFilter params) async* {
    yield* repository.list(params).map((result) => result.fold(
          (_) => [],
          (todos) => todos,
        ));
  }
}
