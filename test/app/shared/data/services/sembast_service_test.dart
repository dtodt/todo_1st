import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:todo1st/app/shared/data/services/sembast_service.dart';

void main() {
  final SembastService service = SembastService();

  test('should return the database factory for sqlite when supplied false',
      () async {
    final factory = await service.getFactory(false);
    expect(factory, isNotNull);
    expect(factory, isA<DatabaseFactory>());
  });

  test('should return the database when supplied a factory', () async {
    final database = await service.openDatabase(databaseFactoryMemoryFs);
    expect(database, isNotNull);
    expect(database, isA<Database>());
  });

  /// ? Flutter web is not enabled within tests, so an error is returned.
  test('should return UnimplementedError when supplied true', () {
    expect(() async => await service.getFactory(true),
        throwsA(isA<UnimplementedError>()));
  });
}
