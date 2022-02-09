import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

import '../../../../../constants/index.dart';

void main() {
  late ITodosLocalDS localDS;

  test('should count 1', () async {
    localDS = TodosMapDS(map: {kUid: fTodo});

    localDS
        .list(TodoFilterModel(state: TodoState.both))
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should count nothing', () async {
    localDS = const TodosMapDS(map: {});

    localDS
        .list(TodoFilterModel(state: TodoState.both))
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should list successfully', () async {
    localDS = TodosMapDS(map: {kUid: fTodo});

    localDS
        .list(TodoFilterModel(state: TodoState.both))
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should list nothing', () async {
    localDS = const TodosMapDS(map: {});

    localDS
        .list(TodoFilterModel(state: TodoState.both))
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should create', () async {
    Map<String, TodoModel> ds = {};
    localDS = TodosMapDS(map: ds);

    final result = await localDS.save(fNewTodoUpdated);
    expect(result.isRight(), true);
    expect(ds[kNewUid], fNewTodoUpdated);
  });

  test('should update', () async {
    Map<String, TodoModel> ds = {kUid: fTodo};
    localDS = TodosMapDS(map: ds);

    final updated = fTodo.copyWith(done: false);

    final result = await localDS.save(updated);
    expect(result.isRight(), true);
    expect(ds[kUid], updated);
  });

  test('should read successfully', () async {
    localDS = TodosMapDS(map: {kUid: fTodo});

    final result = await localDS.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    localDS = const TodosMapDS(map: {});

    final result = await localDS.read(kUid);
    expect(result.isLeft(), true);
  });
}
