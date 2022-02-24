import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/data/index.dart' deferred as data;
import 'package:todo1st/app/modules/todos/domain/index.dart' deferred as domain;
import 'package:todo1st/app/modules/todos/presentation/index.dart'
    deferred as ui;
import 'package:todo1st/app/shared/data/index.dart' deferred as shared_data;
import 'package:uuid/uuid.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<Uuid>((_) => const Uuid()),
    shared_data.$KeyUuidDS,
    data.$TodosSembastDS,
    data.$TodosRepository,
    domain.$TodosCount,
    domain.$TodosList,
    domain.$TodosRead,
    domain.$TodosSave,
    ui.$TodosCubit
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => ui.TodosPage()),
  ];
}
