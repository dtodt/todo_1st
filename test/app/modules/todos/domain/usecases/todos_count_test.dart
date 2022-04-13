import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/core/errors/index.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  late ITodosRepository repository;
  late TodosCount usecase;

  setUpAll(() {
    repository = TodosRepositoryMock();
    usecase = TodosCount(repository);
  });

  test('should count 1', () async {
    when(() => repository.count(TodoFilterModel.all()))
        .thenAnswer((_) async => const Right(kCountAll));

    final result = await usecase(TodoFilterModel.all());
    expect(result, kCountAll);
  });

  test('should count 0', () async {
    when(() => repository.count(TodoFilterModel.all()))
        .thenAnswer((_) async => const Left(Failure()));

    final result = await usecase(TodoFilterModel.all());
    expect(result, fCountEntity);
  });
}
