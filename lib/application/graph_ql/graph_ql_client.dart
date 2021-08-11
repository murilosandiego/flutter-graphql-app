abstract class IGraphQLClient {
  Future<Map<String, dynamic>?> query({
    required String document,
    Map<String, dynamic>? variables,
  });

  Future<Map<String, dynamic>?> mutate({
    required String document,
    Map<String, dynamic>? variables,
  });
}
