import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/modules/todos/presentation/index.dart';
import 'package:todo1st/app/shared/data/index.dart';
import 'package:uuid/uuid.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<Uuid>((_) => const Uuid()),
    $KeyUuidDS,
    $TodosSembastDS,
    $TodosRepository,
    $TodosCount,
    $TodosList,
    $TodosRead,
    $TodosSave,
    $TodosCubit
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const TodosPage()),
  ];
}
