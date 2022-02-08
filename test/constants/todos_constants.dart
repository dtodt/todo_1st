import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

const kDescription = 'Test';
const kUid = 'uid';
const kNewUid = 'newUid';

final fTask = TaskModel(description: kDescription, uid: kUid, done: true);
final fNewTask = TaskModel(description: kDescription);
final fTaskWId = TaskModel(description: kDescription, uid: kNewUid);

final fTaskEntity = TaskEntity(description: kDescription, uid: kUid);
final fTaskEntityUpdated = TaskEntity(
  description: kDescription,
  uid: kUid,
  done: true,
);
final fNewTaskEntity = TaskEntity(description: kDescription);
