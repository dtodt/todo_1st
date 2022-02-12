import 'package:flutter_modular/flutter_modular.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';
import 'package:todo1st/app/app_constants.dart';

class SharedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<DatabaseFactory>((_) => getDatabaseFactory(), export: true),
    AsyncBind<Database>(
      (i) => i<DatabaseFactory>().openDatabase(
        kTodosLocalDatabase,
        onVersionChanged: ((db, oldVersion, newVersion) {
          /// TODO make sure to migrate data when the structure changes
        }),
        version: 1,
      ),
      export: true,
    ),
  ];
}
