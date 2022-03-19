import 'package:sembast/sembast.dart' show Database, DatabaseFactory;
import 'package:sembast_web/sembast_web.dart' deferred as web;

class SembastService {
  Future<DatabaseFactory> getFactory(bool isWeb) async {
    if (isWeb) {
      await web.loadLibrary();
      return web.databaseFactoryWeb;
    }
    throw UnimplementedError();
  }

  Future<Database> openDatabase(DatabaseFactory factory) async {
    // TODO: implement openDatabase
    throw UnimplementedError();
  }
}
