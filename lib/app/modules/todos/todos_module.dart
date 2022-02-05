import 'dart:collection';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/models/index.dart';
import 'package:todo1st/app/modules/todos/data/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';
import 'package:todo1st/app/modules/todos/presentation/cubit/index.dart';
import 'package:todo1st/app/modules/todos/presentation/pages/index.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ITodosLocalDS>((_) => TodosMapDS(map: HashMap<String, TaskModel>())),
    Bind<ITodosRepository>((i) => TodosRepository(i<ITodosLocalDS>())),
    $TodosList,
    $TodosSave,
    $TodosCubit
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const TodosPage()),
  ];
}
