import 'package:todo1st/app/modules/todos/domain/index.dart';

const kDescription = 'Test';
const kUid = 'uid';
const kNewUid = 'newUid';

///? Todo
const kTodoDoneMap = {
  'description': kDescription,
  'done': true,
  'uid': kUid,
};
const kTodoUnDoneMap = {
  'description': kDescription,
  'done': false,
  'uid': kUid,
};
const kTodoNewMap = {
  'description': kDescription,
  'done': false,
  'uid': '',
};

const kTodoDone = TodoEntity(description: kDescription, uid: kUid, done: true);
const kTodoUnDone =
    TodoEntity(description: kDescription, uid: kUid, done: false);
const kTodoNew = TodoEntity(description: kDescription, uid: '', done: false);

///? Todo check
const kTodoCheck = TodoCheck(uid: kUid, checked: true);
