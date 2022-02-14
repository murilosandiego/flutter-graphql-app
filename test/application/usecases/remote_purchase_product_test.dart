import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuconta_marketplace/application/usecases/usecases.dart';
import 'package:nuconta_marketplace/domain/errors/errors.dart';

import 'package:test/test.dart';

import '../../helpers/helpers.dart';

void main() {
  late RemotePurchaseProduct sut;
  late GraphQLClientMock graphQLClient;
  late String document;
  late String offerId;

  void mockPurchaseSuccess() => when(
        () => graphQLClient.mutate(
            document: any(named: 'document'),
            variables: any(named: 'variables'),),
      ).thenAnswer(
        (_) async => getPurchaseSuccessFixture(),
      );

  void mockPurchaseFailure() => when(
        () => graphQLClient.mutate(
            document: any(named: 'document'),
            variables: any(named: 'variables'),),
      ).thenAnswer(
        (_) async => getPurchaseFailureFixture(),
      );

  void mockThrowGraphQLExpcetion() => when(
        () => graphQLClient.mutate(
            document: any(named: 'document'),
            variables: any(named: 'variables'),),
      ).thenThrow(Exception());

  setUp(() {
    graphQLClient = GraphQLClientMock();
    document = faker.randomGenerator.string(100, min: 10);
    offerId = faker.randomGenerator.string(20);

    sut = RemotePurchaseProduct(
      document: document,
      graphQLClient: graphQLClient,
    );

    mockPurchaseSuccess();
  });

  test('Should call graphQLClient.mutate() with correct values', () async {
    await sut.call(offerId: offerId);
    verify(
      () => graphQLClient.mutate(
        document: document,
        variables: <String, dynamic>{
          'offerId': offerId,
        },
      ),
    );
  });

  test('Should return balance if successful', () async {
    final balance = await sut.call(offerId: offerId);
    expect(balance, 995000);
  });

  test('Should throw PurchaseFailure if purchase failure', () async {
    mockPurchaseFailure();
    const errorMessage = "You don't have that much money.";

    final future = sut.call(offerId: offerId);
    expect(future, throwsA(const PurchaseFailure(errorMessage)));
  });

  test('Should throw Exception if error occurs', () async {
    mockThrowGraphQLExpcetion();

    final future = sut.call(offerId: offerId);
    expect(future, throwsA(isA<Exception>()));
  });
}
