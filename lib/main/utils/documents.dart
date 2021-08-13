abstract class DocumentsConstants {
  static const getHomeData = '''
  {
    viewer {
      balance
      name
      offers {
        id
        price
        product {
          name
          description
          image
        }
      }
    }
  }
''';

  static const mutationPurchaseProduct = r'''
  mutation purchaseProduct($offerId: ID!) {
    purchase(offerId: $offerId) {
      errorMessage
      success
      customer {
        balance
      }
    }
  }
''';
}
