import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/shared/data/services/sembast_service.dart';

void main() {
  final SembastService service = SembastService();

  /// ? Flutter web is not enabled within tests, so an error is returned.
  test('should return UnimplementedError when supplied true', () {
    expect(() async => await service.getFactory(true),
        throwsA(isA<UnimplementedError>()));
  });
}
