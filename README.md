# To-Do 1st

[![Test Status][test-status]][test-log] [![Hosting Status][hosting-status]][hosting-log]

A clean architecture To-do list experience with Flutter.

> Check it live: [site]

## Dependencies

- BLoC - for state management;
- Dartz - for functional programming;
- Freezed - for data model handling;
- Modular - for project standards, dependency injection and routes;
- Uuid - for standard id generation;
- Sembast - for local database;

## Setup the project

```sh
# download the deps
flutter pub get
# build generated files
flutter pub run build_runner build --delete-conflicting-outputs
# rename the file lib/firebase_options_template.dart
mv lib/firebase_options_template.dart lib/firebase_options.dart
# fill the environment information of each platform in `lib/firebase_options.dart` with your own firebase project options
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

[site]: https://todo-1st.web.app/
[test-log]: https://github.com/dtodt/todo_1st/actions/workflows/tests.yml
[test-status]: https://github.com/dtodt/todo_1st/actions/workflows/tests.yml/badge.svg
[hosting-log]: https://github.com/dtodt/todo_1st/actions/workflows/build-n-deploy-firebase.yml
[hosting-status]: https://github.com/dtodt/todo_1st/actions/workflows/build-n-deploy-firebase.yml/badge.svg
