import 'package:json_annotation/json_annotation.dart';
import 'package:nuconta_marketplace/application/models/models.dart';
import 'package:nuconta_marketplace/domain/entities/customer_entity.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  CustomerModel({
    this.id,
    this.balance,
    this.name,
    this.offers,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  final String? id;
  final int? balance;
  final String? name;
  final List<OfferModel>? offers;

  CustomerEntity toEntity() => CustomerEntity(
        id: id,
        name: name,
        balance: balance,
        offers: offers?.map((offer) => offer.toEntity()).toList(),
      );
}
