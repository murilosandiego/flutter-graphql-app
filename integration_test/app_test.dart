import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nuconta_marketplace/main.dart';

void main() {
  setUp(() {});

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App Integration test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 4));

    expect(find.text('Hi, Jerry Smith'), findsOneWidget);
    expect(find.text('Balance'), findsOneWidget);
    expect(find.text('Offers'), findsOneWidget);

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    final inkWell = find.byType(InkWell);
    await tester.tap(inkWell.first);
    await tester.pumpAndSettle();

    expect(find.text('Buy now'), findsOneWidget);

    await tester.tap(find.text('Buy now'));
    await tester.pumpAndSettle();

    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Successful purchase'), findsOneWidget);
    expect(find.text('Your purchase was successful :)'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Mr. Meeseeks Box'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Buy now'));
    await tester.pumpAndSettle();

    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Error at checkout'), findsOneWidget);
  });
}
