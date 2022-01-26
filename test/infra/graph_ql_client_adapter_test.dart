import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuconta_marketplace/infra/graph_ql_client_adapter.dart';
import 'package:nuconta_marketplace/main/utils/documents.dart';
import 'package:test/test.dart';

import '../helpers/fixtures/fixtures.dart';

class LinkMock extends Mock implements Link {}

class RequestFake extends Fake implements Request {}

void main() {
  late GraphQLClientAdapter sut;
  late GraphQLClient graphQLClient;
  late LinkMock link;

  setUpAll(() {
    registerFallbackValue<Request>(RequestFake());
  });

  void mockSuccess(Map<String, dynamic>? data) => when(
        () => link.request(any()),
      ).thenAnswer(
        (_) => Stream.fromIterable([
          Response(
            data: data,
            context: const Context().withEntry(
              const HttpLinkResponseContext(
                statusCode: 200,
                headers: {'foo': 'bar'},
              ),
            ),
          ),
        ]),
      );

  setUp(() {
    link = LinkMock();

    graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );

    sut = GraphQLClientAdapter(client: graphQLClient);
  });

  test('Should call query method with correct values', () async {
    mockSuccess(getHomeDataFixture());

    final data = await sut.query(
      document: DocumentsConstants.getHomeData,
    );

    verify(
      () => link.request(
        Request(
          operation: Operation(
            document: gql(DocumentsConstants.getHomeData),
          ),
        ),
      ),
    );

    expect(data, equals(getHomeDataFixture()));
  });

  test('Should call mutate method with correct values', () async {
    mockSuccess(getPurchaseSuccessFixture());

    const variables = {'offerId': 'offer/portal-gun'};

    final data = await sut.mutate(
      document: DocumentsConstants.mutationPurchaseProduct,
      variables: variables,
    );

    verify(
      () => link.request(
        Request(
          operation: Operation(
            document: gql(DocumentsConstants.mutationPurchaseProduct),
          ),
          variables: variables,
        ),
      ),
    );

    expect(data, equals(getPurchaseSuccessFixture()));
  });
}
