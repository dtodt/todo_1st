import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/mixins/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

part 'todos_save.g.dart';

///
@Injectable(singleton: false)
class TodosSave with FutureUseCase<Unit, Todo> {
  final ITodosRepository repository;

  const TodosSave(this.repository);

  @override
  Future<Unit> call(Todo params) async {
    await repository.save(params);
    return unit;
  }
}
