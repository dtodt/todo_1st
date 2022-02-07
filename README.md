# To-Do 1st

A clean architecture To-do list experience with Flutter.

## Dependencies

- Modular - for project standards and dependency injection;
- BLoC - for state management;
- dartx - for utilities;
- dartz - for functional programming;
- freezed and equatable - for data model handling;
- uuid - for standard id generation;

## Setup the project

```sh
# download the deps
flutter pub get
# build generated files
flutter pub run build_runner build --delete-conflicting-outputs
```

## Tests

```sh
# run the tests
flutter test
# run the tests with coverage
flutter test --coverage
# excludes from coverage reports generated files and models
lcov --remove ./coverage/lcov.info '**/*.g.dart' '**/*_model.dart' -o coverage/c_lcov.info
# generate html reports for coverage
genhtml ./coverage/c_lcov.info -o coverage/html
```
