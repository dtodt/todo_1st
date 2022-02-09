import 'package:flutter_test/flutter_test.dart';
import 'package:todo1st/app/modules/todos/presentation/widgets/index.dart';

import '../../../../../constants/index.dart';
import '../fake_app.dart';

void main() {
  testWidgets('task list should load one item and should emit false on tap',
      (tester) async {
    String taskUid = '';
    bool taskChecked = false;

    await tester.pumpWidget(FakeScaffoldApp(
      child: TaskList(
          items: Stream.value([fTodo]),
          onItemChecked: (uid, checked) {
            taskUid = uid;
            taskChecked = checked;
          }),
    ));
    await tester.pumpAndSettle();

    await tester.tap(find.text(kDescription));
    await tester.pumpAndSettle();

    expect(taskUid, kUid);
    expect(taskChecked, false);
  });

  testWidgets('task list should load one item and should emit true on tap',
      (tester) async {
    String taskUid = '';
    bool taskChecked = false;

    await tester.pumpWidget(FakeScaffoldApp(
      child: TaskList(
          items: Stream.value([fNewTodoUpdated]),
          onItemChecked: (uid, checked) {
            taskUid = uid;
            taskChecked = checked;
          }),
    ));
    await tester.pumpAndSettle();

    await tester.tap(find.text(kDescription));
    await tester.pumpAndSettle();

    expect(taskUid, kNewUid);
    expect(taskChecked, true);
  });
}
