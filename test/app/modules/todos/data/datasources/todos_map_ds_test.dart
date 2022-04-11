import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';

import '../../../../../constants/index.dart';

void main() {
  late ITodosLocalDS localDS;

  test('should count sucessfully', () async {
    localDS = TodosMapDS(map: {kUid: fTodo, kNewUid: fNewTodoUpdated});

    final result = await localDS.count(fFilterAll);
    expect(result.isRight(), true);
    expect(
      result.getOrElse(() => TodoCountModel()),
      TodoCountModel(available: 1, done: 1, all: 2),
    );
  });

  test('should list 2, using filter both', () async {
    localDS = TodosMapDS(map: {kUid: fTodo, kNewUid: fNewTodoUpdated});

    localDS.list(fFilterAll).listen(expectAsync1((result) {
      expect(result.isRight(), true);
      expect(result.getOrElse(() => []).length, 2);
    }));
  });

  test('should list 1, using filter done', () async {
    localDS = TodosMapDS(map: {kUid: fTodo, kNewUid: fNewTodoUpdated});

    localDS.list(fFilterDone).listen(expectAsync1((result) {
      expect(result.isRight(), true);
      expect(result.getOrElse(() => []).length, 1);
    }));
  });

  test('should list 0, using filter todo', () async {
    localDS = TodosMapDS(map: {kUid: fTodo});

    localDS.list(fFilterAvailable).listen(expectAsync1((result) {
      expect(result.isRight(), true);
      expect(result.getOrElse(() => []).length, 0);
    }));
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
