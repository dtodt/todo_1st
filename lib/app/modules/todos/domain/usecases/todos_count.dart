import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
class TodosCount with FutureUseCase<TodoCountEntity, TodoFilterEntity> {
  final ITodosRepository repository;

  const TodosCount(this.repository);

  @override
  Future<TodoCountEntity> call(TodoFilterEntity params) async {
    final result = await repository.count(params);
    return result.fold(
      /// TODO: implement model factory
      (_) => throw UnimplementedError(),
      (todos) => todos,
    );
  }
}
