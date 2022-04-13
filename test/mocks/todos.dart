import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

class TodosLocalDSMock extends Mock implements ITodosLocalDS {}

class TodosRepositoryMock extends Mock implements ITodosRepository {}

class TodosAddMock extends Mock implements ITodosAdd {}

class TodosCheckMock extends Mock implements ITodosCheck {}

class TodosFetchMock extends Mock implements ITodosFetch {}
