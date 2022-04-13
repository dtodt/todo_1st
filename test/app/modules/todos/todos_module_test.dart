import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:todo1st/app/modules/todos/data/index.dart';
import 'package:todo1st/app/modules/todos/domain/index.dart';
import 'package:todo1st/app/modules/todos/presentation/bloc/todos_bloc.dart';
import 'package:todo1st/app/modules/todos/todos_module.dart';
import 'package:todo1st/app/shared/data/index.dart';
import 'package:todo1st/app/shared/shared_module.dart';

import '../../../overrides.dart';

void main() {
  setUpAll(() {
    initModules([
      SharedModule(),
      TodosModule(),
    ], replaceBinds: [
      Bind<SembastService>(
        (_) => SembastServiceTester(),
        export: true,
      ),
    ]);
  });

  testWidgets('should setup all dependencies correctly', (_) async {
    await Modular.isModuleReady<SharedModule>();

    final localDS = Modular.get<ITodosLocalDS>();
    expect(localDS, isA<TodosSembastDS>());

    final repository = Modular.get<ITodosRepository>();
    expect(repository, isA<TodosRepository>());

    final saveUsecase = Modular.get<ITodosAdd>();
    expect(saveUsecase, isA<TodosAdd>());

    final readUsecase = Modular.get<ITodosCheck>();
    expect(readUsecase, isA<TodosCheck>());

    final listUsecase = Modular.get<ITodosFetch>();
    expect(listUsecase, isA<TodosFetch>());

    final bloc = Modular.get<TodosBloc>();
    expect(bloc, isA<TodosBloc>());
  });
}
