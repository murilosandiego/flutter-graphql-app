# Flutter GraphQL App

[![ci][ci_badge]][ci_link]
[![Coverage Status](https://coveralls.io/repos/github/murilosandiego/flutter-graphql-app/badge.svg?branch=main)](https://coveralls.io/github/murilosandiego/flutter-graphql-app?branch=main)

This application was developed using a well-defined and decoupled architecture, following TDD (test-driven programming) as a working methodology, Clean Architecture to make the distribution of responsibilities in layers, following the SOLID principles and applying Design Patterns to solve some common problems.

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

| Testing      | Progress |
| :--------- | :-------: |
| Unit       |    ✅     |
| Widgets    |    ✅     |
| Integration |   ✅      |

## Testing

- Unit tests
- Widget Tests
- Cubit/Stream tests
- Integration tests
- Test Doubles

## Libraries and Tools

- bloc 
- equatable 
- flutter_bloc 
- graphql 
- json_annotation

- bloc_test 
- build_runner
- faker
- integration_test
- json_serializable
- mocktail
- network_image_mock
- very_good_analysis

[ci_badge]: https://github.com/murilosandiego/flutter-graphql-app/workflows/graphql_app/badge.svg
[ci_link]: https://github.com/murilosandiego/flutter-graphql-app/actions