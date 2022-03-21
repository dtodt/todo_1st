import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/data/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';
import 'package:todo1st/app/modules/todos/presentation/cubit/index.dart';
import 'package:todo1st/app/modules/todos/todos_module.dart';
import 'package:todo1st/app/shared/data/datasources/index.dart';
import 'package:todo1st/app/shared/data/services/index.dart';
import 'package:todo1st/app/shared/shared_module.dart';

import '../../../overrides/index.dart';

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

    final keyDS = Modular.get<IKeyDS>();
    expect(keyDS, isA<KeyUuidDS>());

    final localDS = Modular.get<ITodosLocalDS>();
    expect(localDS, isA<TodosSembastDS>());

    final repository = Modular.get<ITodosRepository>();
    expect(repository, isA<TodosRepository>());

    final countUsecase = Modular.get<TodosCount>();
    expect(countUsecase, isA<TodosCount>());

    final listUsecase = Modular.get<TodosList>();
    expect(listUsecase, isA<TodosList>());

    final readUsecase = Modular.get<TodosRead>();
    expect(readUsecase, isA<TodosRead>());

    final saveUsecase = Modular.get<TodosSave>();
    expect(saveUsecase, isA<TodosSave>());

    final cubit = Modular.get<TodosCubit>();
    expect(cubit, isA<TodosCubit>());
  });
}
