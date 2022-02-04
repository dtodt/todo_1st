import 'package:todo1st/app/modules/todos/data/models/index.dart';

const kDescription = 'Test';
const kUid = 'newUid';

final fTask = TaskModel(description: kDescription, uid: 'uid', done: true);
final fNewTask = TaskModel(description: kDescription);
final fTaskWId = TaskModel(description: kDescription, uid: kUid);
