import 'package:graphql/client.dart';
import 'package:nuconta_marketplace/application/graph_ql/graph_ql.dart';

class GraphQLClientAdapter implements IGraphQLClient {
  GraphQLClientAdapter({required this.client});
  final GraphQLClient client;

  @override
  Future<Map<String, dynamic>?> query({
    required String document,
    Map<String, dynamic>? variables,
  }) async {
    final options = QueryOptions(
      document: gql(document),
      variables: variables ?? const <String, dynamic>{},
    );

    final result = await client.query(options);
    return result.data;
  }

  @override
  Future<Map<String, dynamic>?> mutate({
    required String document,
    Map<String, dynamic>? variables,
  }) async {}
}
