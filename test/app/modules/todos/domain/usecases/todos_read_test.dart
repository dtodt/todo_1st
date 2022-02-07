import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

import '../../../../../constants/index.dart';
import '../../../../../mocks/index.dart';

void main() {
  late ITodosRepository repository;
  late TodosRead usecase;

  setUpAll(() {
    repository = MockITodosRepository();
    usecase = TodosRead(repository);
  });

  testWidgets('should read successfully', (_) async {
    when(repository.read(kUid)).thenAnswer((_) async => Right(fTask));

    final result = await usecase(kUid);
    expect(result, isNotNull);
  });
}
