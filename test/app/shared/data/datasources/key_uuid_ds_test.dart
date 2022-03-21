import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo1st/app/shared/data/datasources/index.dart';
import 'package:uuid/uuid.dart';

import '../../../../constants/index.dart';
import '../../../../mocks/index.dart';

void main() {
  late IKeyDS keyDS;
  late Uuid uuid;

  setUpAll(() {
    uuid = MockUuid();
    keyDS = KeyUuidDS(uuid);
  });

  test('key uuid ds should return a key when asked', () async {
    when(uuid.v1()).thenReturn(kNewUid);
    expect(keyDS.getKey(), kNewUid);
  });
}
