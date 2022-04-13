import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';

class TodosCountMock extends Mock implements ITodosCount {}

class TodosListMock extends Mock implements ITodosList {}

class TodosReadMock extends Mock implements ITodosRead {}

class TodosSaveMock extends Mock implements ITodosSave {}

class TodosRepositoryMock extends Mock implements ITodosRepository {}

class TodosLocalDSMock extends Mock implements ITodosLocalDS {}
