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
  late TodosList usecase;

  setUpAll(() {
    repository = TodosRepositoryMock();
    usecase = TodosList(repository);
  });

  test('should list successfully', () async {
    when(() => repository.list(TodoFilterModel.all()))
        .thenAnswer((_) => Stream.value(
              Right([fTodo]),
            ));

    usecase(TodoFilterModel.all())
        .listen(expectAsync1((result) => expect(result, isNotEmpty)));
  });

  test('should list nothing', () async {
    when(() => repository.list(TodoFilterModel.all()))
        .thenAnswer((_) => Stream.value(
              const Left(Failure()),
            ));

    usecase(TodoFilterModel.all())
        .listen(expectAsync1((result) => expect(result, isEmpty)));
  });
}
