import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';

import '../../../../../constants/index.dart';

void main() {
  late ITodosLocalDS localDS;

  testWidgets('should list successfully', (_) async {
    localDS = TodosMapDS(map: {'uid': fTask});

    localDS
        .list('')
        .listen(expectAsync1((result) => expect(result.isRight(), true)));
  });

  testWidgets('should list nothing', (_) async {
    localDS = const TodosMapDS();

    localDS
        .list('')
        .listen(expectAsync1((result) => expect(result.isLeft(), true)));
  });
}
