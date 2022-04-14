import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/app_module.dart';
import 'package:todo1st/app/shared/data/index.dart';

import '../overrides.dart';

void main() {
  setUpAll(() {
    initModule(AppModule(), replaceBinds: [
      Bind<SembastService>(
        (_) => SembastServiceTester(),
        export: true,
      ),
    ]);
  });

  testWidgets('should setup all dependencies correctly', (_) async {
    await Modular.isModuleReady<AppModule>();

    final database = Modular.get<Database>();
    expect(database, isA<Database>());
  });
}
