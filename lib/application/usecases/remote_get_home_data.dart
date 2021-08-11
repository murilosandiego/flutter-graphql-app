import 'package:nuconta_marketplace/application/graph_ql/graph_ql_client.dart';
import 'package:nuconta_marketplace/application/models/models.dart';
import 'package:nuconta_marketplace/domain/entities/entities.dart';
import 'package:nuconta_marketplace/domain/usecases/get_home_data.dart';

class RemoteGetHomeData extends GetHomeData {
  RemoteGetHomeData({
    required this.document,
    required this.graphQLClient,
  });

  final String document;
  final IGraphQLClient graphQLClient;

  @override
  Future<CustomerEntity> call() async {
    final result = await graphQLClient.query(document: document);
    // ignore: avoid_dynamic_calls
    final customerRaw = result?['data']['viewer'] as Map<String, dynamic>;
    return CustomerModel.fromJson(customerRaw).toEntity();
  }
}
