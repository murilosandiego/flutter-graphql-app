import 'package:equatable/equatable.dart';

import 'package:nuconta_marketplace/domain/entities/entities.dart';

class CustomerEntity extends Equatable {
  const CustomerEntity({
    this.id,
    this.balance,
    this.name,
    this.offers,
  });

  final String? id;
  final int? balance;
  final String? name;
  final List<OfferEntity>? offers;

  @override
  List<Object?> get props => [
        id,
        balance,
        name,
        offers,
      ];
}
