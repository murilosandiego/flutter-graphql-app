import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuconta_marketplace/domain/usecases/usecases.dart';
import 'package:nuconta_marketplace/ui/pages/pages.dart';

import '../../../../helpers/helpers.dart';

class GetHomeDataMock extends Mock implements GetHomeData {}

void main() {
  late HomeCubit sut;
  late GetHomeDataMock getHomeData;

  void mockSuccessGetHomeData() => when(() => getHomeData()).thenAnswer(
        (_) async => tCustomerEntity,
      );

  void mockErrorGetHomeData() =>
      when(() => getHomeData()).thenThrow(Exception());

  setUp(() {
    getHomeData = GetHomeDataMock();
    sut = HomeCubit(getHomeData: getHomeData);
  });

  blocTest<HomeCubit, HomeState>(
    'Should call getHomeData once when HomeCubit is build',
    build: () => sut,
    verify: (_) {
      verify(() => getHomeData()).called(1);
    },
  );

  blocTest<HomeCubit, HomeState>(
    'Should emits [HomeState.loading HomeState.loaded] on success',
    setUp: () {
      mockSuccessGetHomeData();
    },
    build: () => sut,
    act: (cubit) => cubit.handleGetHomeData(),
    expect: () => [
      const HomeState.loading(),
      const HomeState.loaded(tCustomerEntity),
    ],
  );

  blocTest<HomeCubit, HomeState>(
    'Should emits [HomeState.loading HomeState.error] on error',
    setUp: () {
      mockErrorGetHomeData();
    },
    build: () => sut,
    act: (cubit) => cubit.handleGetHomeData(),
    expect: () => [
      const HomeState.loading(),
      const HomeState.error(),
    ],
  );
}
