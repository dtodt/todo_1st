import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/core/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

import '../../../../../constants.dart';
import '../../../../../mocks.dart';

void main() {
  late ITodosRepository repository;
  late TodosFetch usecase;

  setUpAll(() {
    repository = TodosRepositoryMock();
    usecase = TodosFetch(repository);
  });

  test('should list successfully', () async {
    when(() => repository.list(TodoFilter.all()))
        .thenAnswer((_) => Stream.value(
              const Right([kTodoDone]),
            ));

    usecase(TodoFilter.all())
        .listen(expectAsync1((result) => expect(result, isNotEmpty)));
  });

  test('should list nothing', () async {
    when(() => repository.list(TodoFilter.all()))
        .thenAnswer((_) => Stream.value(
              const Left(Failure()),
            ));

    usecase(TodoFilter.all())
        .listen(expectAsync1((result) => expect(result, isEmpty)));
  });
}
