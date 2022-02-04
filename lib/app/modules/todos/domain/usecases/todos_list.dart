import 'package:todo1st/app/core/mixins/usecases.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

///
class TodosList with StreamUseCase<List<TaskEntity>, String> {
  final ITodosRepository repository;

  const TodosList(this.repository);

  @override
  Stream<List<TaskEntity>> call(String params) async* {
    yield* repository.list(params).map((result) => result.fold(
          (_) => [],
          (todos) => todos,
        ));
  }
}
