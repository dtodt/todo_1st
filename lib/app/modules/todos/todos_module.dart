import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/modules/todos/presentation/index.dart';
import 'package:todo1st/app/shared/data/index.dart';
import 'package:uuid/uuid.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<Uuid>((_) => const Uuid()),
    Bind<IKeyDS>((i) => KeyUuidDS(i.get<Uuid>())),
    Bind<ITodosLocalDS>(
      (i) => TodosSembastDS(i.get<Database>(), i.get<IKeyDS>()),
    ),
    Bind<ITodosRepository>((i) => TodosRepository(i.get<ITodosLocalDS>())),
    Bind<ITodosCount>((i) => TodosCount(i.get<ITodosRepository>())),
    Bind<ITodosList>((i) => TodosList(i.get<ITodosRepository>())),
    Bind<ITodosRead>((i) => TodosRead(i.get<ITodosRepository>())),
    Bind<ITodosSave>((i) => TodosSave(i.get<ITodosRepository>())),
    Bind<TodosCubit>(
      (i) => TodosCubit(
        i.get<TodosCount>(),
        i.get<TodosList>(),
        i.get<TodosRead>(),
        i.get<TodosSave>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const TodosPage()),
  ];
}
