import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/todo_filter.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosList usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosList(repository);
  });

  test('should list successfully', () async {
    when(repository.list(TodoFilterEntity())).thenAnswer((_) => Stream.value(
          Right([fTodo]),
        ));

    usecase(TodoFilterEntity())
        .listen(expectAsync1((result) => expect(result, isNotEmpty)));
  });

  test('should list nothing', () async {
    when(repository.list(TodoFilterEntity())).thenAnswer((_) => Stream.value(
          Left(Failure()),
        ));

    usecase(TodoFilterEntity())
        .listen(expectAsync1((result) => expect(result, isEmpty)));
  });
}
