import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:nuconta_marketplace/domain/errors/errors.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuconta_marketplace/domain/usecases/usecases.dart';
import 'package:nuconta_marketplace/ui/pages/pages.dart';

import '../../../../helpers/helpers.dart';

class GetHomeDataMock extends Mock implements GetHomeData {}

class PurchaseProductMock extends Mock implements PurchaseProduct {}

void main() {
  late HomeCubit sut;
  late GetHomeDataMock getHomeData;
  late PurchaseProductMock purchaseProduct;
  late String offerId;

  setUp(() {
    getHomeData = GetHomeDataMock();
    purchaseProduct = PurchaseProductMock();
    sut = HomeCubit(
      getHomeData: getHomeData,
      purchaseProduct: purchaseProduct,
    );

    offerId = faker.randomGenerator.string(10);
  });

  group('Get home data', () {
    void mockSuccessGetHomeData() => when(() => getHomeData()).thenAnswer(
          (_) async => tCustomerEntity,
        );

    void mockErrorGetHomeData() =>
        when(() => getHomeData()).thenThrow(Exception());

    blocTest<HomeCubit, HomeState>(
      'Should call getHomeData once when HomeCubit is build',
      build: () => sut,
      verify: (_) {
        verify(() => getHomeData()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'Should emits [HomeState.loading HomeState.success] on success',
      setUp: () {
        mockSuccessGetHomeData();
      },
      build: () => sut,
      act: (cubit) => cubit.handleGetHomeData(),
      expect: () => [
        const HomeState.loading(),
        const HomeState.success(tCustomerEntity),
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
  });
  group('Purchase product', () {
    const balance = 9999;
    final tCustomerEntityUpdated = tCustomerEntity.copyWith(balance: balance);
    const errorMessage = "You don't have that much money.";

    void mockPurchaseProductSuccess() =>
        when(() => purchaseProduct(offerId: any(named: 'offerId'))).thenAnswer(
          (_) async => balance,
        );

    void mockPurchaseProductFailure() =>
        when(() => purchaseProduct(offerId: any(named: 'offerId'))).thenThrow(
          const PurchaseFailure(errorMessage),
        );

    void mockUnexpectedError() =>
        when(() => purchaseProduct(offerId: any(named: 'offerId'))).thenThrow(
          Exception(),
        );

    blocTest<HomeCubit, HomeState>(
      'Should call purchaseProduct() once when handleParchaseProduct is called',
      build: () => sut,
      act: (cubit) => cubit.handlePurchaseProduct(offerId: offerId),
      verify: (_) {
        verify(() => purchaseProduct(offerId: offerId)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      '''Should emits [HomeState.loading HomeState.purchaseSuccess] when purchase is successful''',
      setUp: () {
        mockPurchaseProductSuccess();
      },
      seed: () => const HomeState.success(tCustomerEntity),
      build: () => sut,
      act: (cubit) => cubit.handlePurchaseProduct(offerId: offerId),
      expect: () => [
        const HomeState(customerEntity: tCustomerEntity),
        HomeState.purchaseSuccess(tCustomerEntityUpdated),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '''Should emits [HomeState.loading HomeState.purchaseFailure] when the purchase is fails''',
      setUp: () {
        mockPurchaseProductFailure();
      },
      seed: () => const HomeState.success(tCustomerEntity),
      build: () => sut,
      act: (cubit) => cubit.handlePurchaseProduct(offerId: offerId),
      expect: () => [
        const HomeState(customerEntity: tCustomerEntity),
        const HomeState(
          customerEntity: tCustomerEntity,
          status: HomeStatus.purchaseFailure,
          errorMessage: errorMessage,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      '''Should emits [HomeState.loading HomeState.error] when the unexpected error occurs''',
      setUp: () {
        mockUnexpectedError();
      },
      seed: () => const HomeState.success(tCustomerEntity),
      build: () => sut,
      act: (cubit) => cubit.handlePurchaseProduct(offerId: offerId),
      expect: () => [
        const HomeState(customerEntity: tCustomerEntity),
        const HomeState.error()
      ],
    );
  });
}
