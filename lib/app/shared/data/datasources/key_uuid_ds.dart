import 'package:flutter_modular/flutter_modular.dart';
import 'package:uuid/uuid.dart';

import 'i_key_ds.dart';

part 'key_uuid_ds.g.dart';

///
@Injectable(lazy: true, singleton: true)
class KeyUuidDS implements IKeyDS {
  final Uuid _uuid;

  const KeyUuidDS(this._uuid);

  @override
  String getKey() {
    return _uuid.v1();
  }
}
