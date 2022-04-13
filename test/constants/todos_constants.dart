import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

const kDescription = 'Test';
const kUid = 'uid';
const kNewUid = 'newUid';

///? Todo entity
const kTodoMap = {
  'description': kDescription,
  'done': true,
  'uid': kUid,
};
const kTodoUpdatedMap = {
  'description': kDescription,
  'done': false,
  'uid': kUid,
};
const kNewTodoMap = {
  'description': kDescription,
  'done': false,
  'uid': '',
};
const kCreatedTodoMap = {
  'description': kDescription,
  'done': false,
  'uid': kNewUid,
};
const kNewTodoUpdatedMap = {
  'description': kDescription,
  'done': true,
  'uid': kNewUid,
};

/// ? Count entity
const kCountMap = {
  'all': 0,
  'available': 0,
  'done': 0,
};

final TodoCountEntity fCountEntity = TodoCountModel.empty();

///? Filter entity
const kCountAll = TodoCountEntity(all: 1, available: 0, done: 0);

final fTodo = TodoModel(description: kDescription, uid: kUid, done: true);
final TodoEntity fNewTodo =
    TodoModel.empty().copyWith(description: kDescription);
final fNewTodoUpdated =
    TodoModel(description: kDescription, uid: kNewUid, done: false);

final TodoEntity fNewTodoEntity =
    TodoModel.empty().copyWith(description: kDescription);

final fFilterAll = TodoFilterModel(state: TodoState.all);
final fFilterAvailable = TodoFilterModel(state: TodoState.available);
final fFilterDone = TodoFilterModel(state: TodoState.done);
