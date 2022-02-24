import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/todos_module.dart' deferred as todos;
import 'package:todo1st/app/shared/shared_module.dart' deferred as shared;

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<Module> imports = [
    shared.SharedModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: todos.TodosModule()),
  ];
}
