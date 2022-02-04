import 'package:mockito/annotations.dart';
import 'package:todo1st/app/modules/todos/data/datasources/index.dart';
import 'package:todo1st/app/modules/todos/domain/repositories/index.dart';
import 'package:todo1st/app/modules/todos/domain/usecases/index.dart';

@GenerateMocks([TodosList, TodosSave, ITodosRepository, ITodosLocalDS])
void main() {
  /// ? Mock generator class
}
