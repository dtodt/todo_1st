import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/domain/entities/index.dart';

const kDescription = 'Test';
const kUid = 'uid';
const kNewUid = 'newUid';

final fTodo = TodoModel(description: kDescription, uid: kUid, done: true);
final fNewTodo = TodoModel(description: kDescription, uid: '', done: false);
final fNewTodoUpdated =
    TodoModel(description: kDescription, uid: kNewUid, done: false);

final TodoEntity fNewTodoEntity = TodoEntity(description: kDescription);

final fFilterBoth = TodoFilterModel(state: TodoState.both);
final fFilterDone = TodoFilterModel(state: TodoState.done);
final fFilterTodo = TodoFilterModel(state: TodoState.todo);
