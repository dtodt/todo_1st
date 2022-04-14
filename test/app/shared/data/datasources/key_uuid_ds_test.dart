import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo1st/app/shared/data/index.dart';
import 'package:uuid/uuid.dart';

import '../../../../constants.dart';
import '../../../../mocks.dart';

void main() {
  late IKeyDS keyDS;
  late Uuid uuid;

  setUpAll(() {
    uuid = UuidMock();
    keyDS = KeyUuidDS(uuid);
  });

  test('key uuid ds should return a key when asked', () async {
    when(() => uuid.v1()).thenReturn(kNewUid);
    expect(keyDS.getKey(), kNewUid);
  });
}
