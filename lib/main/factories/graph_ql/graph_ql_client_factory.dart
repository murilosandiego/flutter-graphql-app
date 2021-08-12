import 'package:nuconta_marketplace/application/graph_ql/graph_ql.dart';
import 'package:nuconta_marketplace/infra/graph_ql_client_adapter.dart';
import 'package:nuconta_marketplace/main/singletons/graph_ql_client_singleton.dart';

IGraphQLClient makeGraphQLClient() => GraphQLClientAdapter(
      client: GraphQLClientSingleton.instance.client,
    );
