import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo1st/app/modules/todos/presentation/pages/todos_page.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const TodosPage()),
  ];
}
