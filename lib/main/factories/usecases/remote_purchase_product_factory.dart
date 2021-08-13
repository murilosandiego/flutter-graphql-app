import 'package:nuconta_marketplace/application/usecases/usecases.dart';
import 'package:nuconta_marketplace/main/factories/factories.dart';
import 'package:nuconta_marketplace/main/utils/utils.dart';

RemotePurchaseProduct makeRemotePurchaseProduct() => RemotePurchaseProduct(
      document: DocumentsConstants.mutationPurchaseProduct,
      graphQLClient: makeGraphQLClient(),
    );
