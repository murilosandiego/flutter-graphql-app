import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nuconta_marketplace/ui/pages/pages.dart';
import 'package:nuconta_marketplace/ui/utils/utils.dart';
import '../home/../../../helpers/helpers.dart';

class HomeCubitMock extends MockCubit<HomeState> implements HomeCubit {}

class HomeStateFake extends Fake implements HomeState {}

void main() {
  late HomeCubitMock homeCubit;

  setUpAll(() {
    registerFallbackValue<HomeState>(HomeStateFake());
  });

  setUp(() {
    homeCubit = HomeCubitMock();
  });

  Future _loadPage(WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        BlocProvider<HomeCubit>.value(
          value: homeCubit,
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );
    });
  }

  testWidgets('should render correctly when HomeStatus.loading',
      (tester) async {
    when(() => homeCubit.state).thenReturn(const HomeState.loading());
    await _loadPage(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Scaffold), findsNothing);
  });

  testWidgets('should render correctly when HomeStatus.error', (tester) async {
    when(() => homeCubit.state).thenReturn(const HomeState.error());
    when(() => homeCubit.handleGetHomeData()).thenAnswer((_) async => [null]);

    await _loadPage(tester);

    expect(find.text(StringConstants.errorWhenFetchingData), findsOneWidget);
    expect(find.text(StringConstants.tryAgain), findsOneWidget);
    expect(find.byType(Scaffold), findsNothing);

    await tester.tap(find.byType(ElevatedButton));
    verify(() => homeCubit.handleGetHomeData()).called(1);
  });

  testWidgets('should render correctly when HomeStatus.success',
      (tester) async {
    when(() => homeCubit.state)
        .thenReturn(const HomeState.success(tCustomerEntity));

    await _loadPage(tester);

    expect(find.byType(Scaffold), findsOneWidget);

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);
    expect(
        (listView.evaluate().first.widget as ListView).semanticChildCount, 2);
    // ignore: use_raw_strings
    expect(find.text('R\$ 1.000.000,00'), findsOneWidget);
    expect(find.text('Hi, Jerry Smith'), findsOneWidget);

    // ignore: use_raw_strings
    expect(find.text('R\$ 5.000,00'), findsOneWidget);
    expect(find.text('Portal Gun'), findsOneWidget);

    // ignore: use_raw_strings
    expect(find.text('R\$ 999.999.999,00'), findsOneWidget);
    expect(find.text('Mr. Meeseeks Box'), findsOneWidget);
  });

  testWidgets('Should show the bottom sheet when it is touched on the offer',
      (tester) async {
    when(() => homeCubit.state)
        .thenReturn(const HomeState.success(tCustomerEntity));

    await _loadPage(tester);

    final inkWell = find.byType(InkWell);

    await tester.tap(inkWell.first);
    await tester.pumpAndSettle();

    expect(find.text(StringConstants.buyNow), findsOneWidget);
    expect(find.text('${tCustomerEntity.offers?[0].product?.description}'),
        findsOneWidget);
  });
}
