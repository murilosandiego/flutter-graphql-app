import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuconta_marketplace/application/usecases/remote_get_home_data.dart';

import 'package:test/test.dart';

import '../../helpers/helpers.dart';

void main() {
  late RemoteGetHomeData sut;
  late GraphQLClientMock graphQLClient;
  late String document;

  void mockGraphQLClientSuccess() =>
      when(() => graphQLClient.query(document: any(named: 'document')))
          .thenAnswer(
        (_) async => getHomeDataFixture(),
      );

  setUp(() {
    graphQLClient = GraphQLClientMock();
    document = faker.randomGenerator.string(100, min: 10);
    sut = RemoteGetHomeData(
      document: document,
      graphQLClient: graphQLClient,
    );
    mockGraphQLClientSuccess();
  });

  test('Should call graphQLClient.query with correct values', () async {
    await sut.call();
    verify(() => graphQLClient.query(document: document));
  });

  test('Should return Customer on success', () async {
    final result = await sut.call();
    expect(result, tCustomerEntity);
  });
}
