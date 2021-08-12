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
}
