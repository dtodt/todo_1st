import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/todos_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: TodosModule()),
  ];
}
