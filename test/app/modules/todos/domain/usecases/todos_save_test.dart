import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosSave usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosSave(repository);
  });

  testWidgets('should not fail', (_) async {
    when(repository.save(fTask)).thenAnswer((_) async => const Right(unit));

    final result = await usecase(fTask);
    expect(result, isNotNull);
  });
}
