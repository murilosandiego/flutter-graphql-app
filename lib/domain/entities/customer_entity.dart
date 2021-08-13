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

  CustomerEntity copyWith({
    String? id,
    int? balance,
    String? name,
    List<OfferEntity>? offers,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      name: name ?? this.name,
      offers: offers ?? this.offers,
    );
  }
}
