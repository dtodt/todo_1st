import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/modules/todos/presentation/index.dart';
import 'package:todo1st/app/shared/data/index.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ITodosLocalDS>(
      (i) => TodosSembastDS(i.get<Database>(), i.get<IKeyDS>()),
    ),
    Bind<ITodosRepository>(
      (i) => TodosRepository(i.get<ITodosLocalDS>()),
    ),
    Bind<ITodosAdd>((i) => TodosAdd(i.get<ITodosRepository>())),
    Bind<ITodosCheck>((i) => TodosCheck(i.get<ITodosRepository>())),
    Bind<ITodosFetch>((i) => TodosFetch(i.get<ITodosRepository>())),
    Bind<TodosBloc>(
      (i) => TodosBloc(
        i.get<ITodosAdd>(),
        i.get<ITodosCheck>(),
        i.get<ITodosFetch>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const TodosPage()),
  ];
}
