# Flutter GraphQL App

[![ci][ci_badge]][ci_link]
[![coverage][coverage_badge]][ci_link]

This application was developed using a well-defined and decoupled architecture, following TDD (test-driven programming) as a working methodology, Clean Architecture to make the distribution of responsibilities in layers, following the SOLID principles and applying Design Patterns to solve some common problems.

### I suggest running on the latest stable version (2.2.3) of Flutter.  

```
flutter pub get
flutter run
```
### Unit test

```
flutter test
```

### Integration test

```
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```


[ci_badge]: https://github.com/murilosandiego/flutter-graphql-app/workflows/graphql_app/badge.svg
[ci_link]: https://github.com/murilosandiego/flutter-graphql-app/actions
[coverage_badge]: https://raw.githubusercontent.com/murilosandiego/flutter-graphql-app/main/coverage_badge.svg