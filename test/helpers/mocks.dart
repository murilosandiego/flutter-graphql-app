import 'package:mocktail/mocktail.dart';
import 'package:nuconta_marketplace/application/graph_ql/graph_ql.dart';
import 'package:nuconta_marketplace/domain/entities/entities.dart';

class GraphQLClientMock extends Mock implements IGraphQLClient {}

const tCustomerEntity = CustomerEntity(
  id: 'cccc3f48-dd2c-43ba-b8de-8945e7ababab',
  balance: 1000000,
  name: 'Jerry Smith',
  offers: <OfferEntity>[
    OfferEntity(
      id: 'offer/portal-gun',
      price: 5000,
      product: ProductEntity(
          id: 'product/portal-gun',
          name: 'Portal Gun',
          description:
              'The Portal Gun is a gadget that allows the user(s) to travel between different universes/dimensions/realities.',
          image:
              'https://vignette.wikia.nocookie.net/rickandmorty/images/5/55/Portal_gun.png/revision/latest/scale-to-width-down/310?cb=20140509065310',),
    ),
    OfferEntity(
      id: 'offer/mr-meeseeks-box',
      price: 999999999,
      product: ProductEntity(
          id: 'product/mr-meeseeks-box',
          name: 'Mr. Meeseeks Box',
          description:
              // ignore: lines_longer_than_80_chars
              'The Mr. Meeseeks Box is a gadget that creates a Mr. Meeseeks for the purpose of completing one given objective.',
          image:
              'https://vignette.wikia.nocookie.net/rickandmorty/images/f/f7/Mr._Meeseeks_Box.png/revision/latest/scale-to-width-down/310?cb=20160909153718',),
    )
  ],
);
