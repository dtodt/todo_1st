import 'package:sembast/sembast.dart' show DatabaseFactory;
import 'package:sembast/sembast_memory.dart';
import 'package:todo1st/app/shared/data/index.dart';

class SembastServiceTester extends SembastService {
  @override
  Future<DatabaseFactory> getFactory(bool isWeb) async {
    return databaseFactoryMemoryFs;
  }
}
