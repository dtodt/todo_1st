import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosCount usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosCount(repository);
  });

  test('should count 1', () async {
    when(repository.count(TodoFilterEntity()))
        .thenAnswer((_) async => Right(TodoCountEntity(total: 1)));

    final result = await usecase(TodoFilterEntity());
    expect(result, TodoCountEntity(total: 1));
  });

  test('should count 0', () async {
    when(repository.count(TodoFilterEntity()))
        .thenAnswer((_) async => Left(Failure()));

    final result = await usecase(TodoFilterEntity());
    expect(result, TodoCountEntity());
  });
}
