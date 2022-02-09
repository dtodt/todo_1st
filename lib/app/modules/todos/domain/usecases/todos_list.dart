import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

part 'todos_list.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosList with StreamUseCase<List<Todo>, TodoFilter> {
  final ITodosRepository repository;

  const TodosList(this.repository);

  @override
  Stream<List<Todo>> call(TodoFilter params) async* {
    yield* repository.list(params).map((result) => result.fold(
          (_) => [],
          (todos) => todos,
        ));
  }
}
