import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/task_model.dart';

import '../../../../../constants/index.dart';

void main() {
  late ITodosLocalDS localDS;

  test('should count 1', () async {
    localDS = TodosMapDS(map: {kUid: fTask});

    localDS
        .count('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should count nothing', () async {
    localDS = const TodosMapDS();

    localDS
        .count('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should list successfully', () async {
    localDS = TodosMapDS(map: {kUid: fTask});

    localDS
        .list('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  test('should list nothing', () async {
    localDS = const TodosMapDS();

    localDS
        .list('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  test('should create', () async {
    Map<String, TaskModel> ds = {};
    localDS = TodosMapDS(map: ds);

    final result = await localDS.save(fTaskWId);
    expect(result.isRight(), true);
    expect(ds[kNewUid], fTaskWId);
  });

  test('should update', () async {
    Map<String, TaskModel> ds = {kUid: fTask};
    localDS = TodosMapDS(map: ds);

    final updated = fTask.copyWith(done: false);

    final result = await localDS.save(updated);
    expect(result.isRight(), true);
    expect(ds[kUid], updated);
  });

  test('should read successfully', () async {
    localDS = TodosMapDS(map: {kUid: fTask});

    final result = await localDS.read(kUid);
    expect(result.isRight(), true);
  });

  test('should read nothing', () async {
    localDS = const TodosMapDS();

    final result = await localDS.read(kUid);
    expect(result.isLeft(), true);
  });
}
