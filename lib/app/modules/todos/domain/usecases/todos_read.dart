import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/mixins/usecases.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

part 'todos_read.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosRead with FutureUseCase<TaskEntity, String> {
  final ITodosRepository repository;

  const TodosRead(this.repository);

  @override
  Future<TaskEntity> call(String params) async {
    final foldable = await repository.read(params);
    return foldable.getOrElse(() => TaskEntity(description: ''));
  }
}
