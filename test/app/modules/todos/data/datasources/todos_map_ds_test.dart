import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/task_model.dart';

import '../../../../../constants/index.dart';

void main() {
  late ITodosLocalDS localDS;

  testWidgets('should count 1', (_) async {
    localDS = TodosMapDS(map: {kUid: fTask});

    localDS
        .count('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  testWidgets('should count nothing', (_) async {
    localDS = const TodosMapDS();

    localDS
        .count('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  testWidgets('should list successfully', (_) async {
    localDS = TodosMapDS(map: {kUid: fTask});

    localDS
        .list('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  testWidgets('should list nothing', (_) async {
    localDS = const TodosMapDS();

    localDS
        .list('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });

  testWidgets('should create', (_) async {
    Map<String, TaskModel> ds = {};
    localDS = TodosMapDS(map: ds);

    final result = await localDS.save(fTaskWId);
    expect(result.isRight(), true);
    expect(ds[kNewUid], fTaskWId);
  });

  testWidgets('should update', (_) async {
    Map<String, TaskModel> ds = {kUid: fTask};
    localDS = TodosMapDS(map: ds);

    final updated = fTask.copyWith(done: false);

    final result = await localDS.save(updated);
    expect(result.isRight(), true);
    expect(ds[kUid], updated);
  });

  testWidgets('should read successfully', (_) async {
    localDS = TodosMapDS(map: {kUid: fTask});

    final result = await localDS.read(kUid);
    expect(result.isRight(), true);
  });

  testWidgets('should read nothing', (_) async {
    localDS = const TodosMapDS();

    final result = await localDS.read(kUid);
    expect(result.isLeft(), true);
  });
}
