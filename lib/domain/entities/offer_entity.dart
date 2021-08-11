import 'package:equatable/equatable.dart';

import 'package:nuconta_marketplace/domain/entities/entities.dart';

class OfferEntity extends Equatable {
  const OfferEntity({
    this.id,
    this.price,
    this.product,
  });

  final String? id;
  final int? price;
  final ProductEntity? product;

  @override
  List<Object?> get props => [
        id,
        price,
        product,
      ];
}
