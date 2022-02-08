import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/core/mixins/usecases.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';

part 'todos_read.g.dart';

///
@Injectable(lazy: true, singleton: false)
class TodosRead with FutureUseCase<Either<Failure, TaskEntity>, String> {
  final ITodosRepository repository;

  const TodosRead(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(String params) async {
    return await repository.read(params);
  }
}
