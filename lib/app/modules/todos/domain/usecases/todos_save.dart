import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/mixins/usecases.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

part 'todos_save.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosSave with FutureUseCase<Unit, TaskEntity> {
  final ITodosRepository repository;

  const TodosSave(this.repository);

  @override
  Future<Unit> call(TaskEntity params) async {
    await repository.save(params);

    return unit;
  }
}
