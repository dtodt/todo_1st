import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/shared/data/index.dart';
import 'package:todo1st/app/shared/shared_module.dart';

import '../../overrides.dart';

void main() {
  setUpAll(() {
    initModule(SharedModule(), replaceBinds: [
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

    final database = Modular.get<Database>();
    expect(database, isA<Database>());
  });
}
