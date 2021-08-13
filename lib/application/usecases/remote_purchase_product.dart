import 'package:nuconta_marketplace/application/graph_ql/graph_ql.dart';
import 'package:nuconta_marketplace/application/helpers/helpers.dart';
import 'package:nuconta_marketplace/application/models/models.dart';
import 'package:nuconta_marketplace/domain/errors/errors.dart';
import 'package:nuconta_marketplace/domain/usecases/purchase_product.dart';

class RemotePurchaseProduct implements PurchaseProduct {
  RemotePurchaseProduct({
    required this.document,
    required this.graphQLClient,
  });

  final String document;
  final IGraphQLClient graphQLClient;

  @override
  Future<int?> call({required String offerId}) async {
    final result = await graphQLClient.mutate(
      document: document,
      variables: <String, dynamic>{KeyConstants.offerId: offerId},
    );

    final json = result?[KeyConstants.purchase] as Map<String, dynamic>;

    final purchaseResponseModel = PurchaseResponseModel.fromJson(json);

    if (purchaseResponseModel.success == true) {
      return purchaseResponseModel.customer?.balance;
    }

    throw PurchaseFailure(purchaseResponseModel.errorMessage);
  }
}
