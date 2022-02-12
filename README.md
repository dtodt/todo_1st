# To-Do 1st

A clean architecture To-do list experience with Flutter.

## Dependencies

- BLoC - for state management;
- Dartx - for utilities;
- Dartz - for functional programming;
- Freezed - for data model handling;
- Modular - for project standards, dependency injection and routes;
- Uuid - for standard id generation;
- Sembast - for local database;
- Shared preferences - for preferences storage;

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
