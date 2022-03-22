import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';
import 'package:todo1st/app/shared/data/services/index.dart';

class SharedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<SembastService>((_) => SembastService(), export: true),
    AsyncBind<DatabaseFactory>(
      (i) => i<SembastService>().getFactory(kIsWeb),
      export: true,
    ),
    AsyncBind<Database>(
      (i) => i<SembastService>().openDatabase(i<DatabaseFactory>()),
      export: true,
    ),
  ];
}
