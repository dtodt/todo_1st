import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:todo1st/app/app_module.dart';

void main() {
  setUpAll(() {
    initModule(AppModule(), replaceBinds: [
      Bind<DatabaseFactory>((_) => databaseFactoryMemoryFs, export: true),
    ]);
  });

  testWidgets('should setup all dependencies correctly', (_) async {
    await Modular.isModuleReady<AppModule>();

    final database = Modular.get<Database>();
    expect(database, isA<Database>());
  });
}
