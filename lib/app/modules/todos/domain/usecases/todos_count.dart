import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

part 'todos_count.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosCount with StreamUseCase<int, TodoFilter> {
  final ITodosRepository repository;

  const TodosCount(this.repository);

  @override
  Stream<int> call(TodoFilter params) async* {
    yield* repository.count(params).map((result) => result.fold(
          (_) => 0,
          (todos) => todos,
        ));
  }
}
