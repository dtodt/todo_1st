import 'package:uuid/uuid.dart';

import 'i_key_ds.dart';

///
class KeyUuidDS implements IKeyDS {
  final Uuid _uuid;

  const KeyUuidDS(this._uuid);

  @override
  String getKey() {
    return _uuid.v1();
  }
}
