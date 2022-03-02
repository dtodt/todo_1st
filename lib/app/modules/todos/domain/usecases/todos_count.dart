import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

part 'todos_count.g.dart';

///
@Injectable(singleton: false)
class TodosCount with FutureUseCase<TodoCount, TodoFilter> {
  final ITodosRepository repository;

  const TodosCount(this.repository);

  @override
  Future<TodoCount> call(TodoFilter params) async {
    final result = await repository.count(params);
    return result.fold(
      (_) => TodoCountEntity(),
      (todos) => todos,
    );
  }
}
