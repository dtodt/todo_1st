import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
class TodosList with StreamUseCase<List<TodoEntity>, TodoFilterEntity> {
  final ITodosRepository repository;

  const TodosList(this.repository);

  @override
  Stream<List<TodoEntity>> call(TodoFilterEntity params) async* {
    yield* repository.list(params).map((result) => result.fold(
          (_) => [],
          (todos) => todos,
        ));
  }
}
