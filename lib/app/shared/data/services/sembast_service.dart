import 'package:sembast/sembast.dart' show Database, DatabaseFactory;
import 'package:sembast_sqflite/sembast_sqflite.dart' deferred as mobile_impl
    show getDatabaseFactorySqflite;
import 'package:sembast_web/sembast_web.dart' deferred as web;
import 'package:sqflite/sqflite.dart' deferred as mobile show databaseFactory;
import 'package:todo1st/app/app_constants.dart';

class SembastService {
  Future<DatabaseFactory> getFactory(bool isWeb) async {
    if (isWeb) {
      await web.loadLibrary();
      return web.databaseFactoryWeb;
    }

    await mobile.loadLibrary();
    await mobile_impl.loadLibrary();
    return mobile_impl.getDatabaseFactorySqflite(mobile.databaseFactory);
  }

  Future<Database> openDatabase(DatabaseFactory factory) async {
    return factory.openDatabase(
      kTodosLocalDatabase,
      onVersionChanged: _onVersionChanged,
      version: 1,
    );
  }

  Future<dynamic> _onVersionChanged(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    /// TODO make sure to migrate data when the structure changes
  }
}
