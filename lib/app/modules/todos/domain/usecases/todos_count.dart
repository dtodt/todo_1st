import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/data/models/todo_count.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
abstract class ITodosCount
    with FutureUseCase<TodoCountEntity, TodoFilterEntity> {}

///
class TodosCount implements ITodosCount {
  final ITodosRepository repository;

  const TodosCount(this.repository);

  @override
  Future<TodoCountEntity> call(TodoFilterEntity params) async {
    final result = await repository.count(params);
    return result.fold(
      (_) => TodoCountModel.empty(),
      (todos) => todos,
    );
  }
}
