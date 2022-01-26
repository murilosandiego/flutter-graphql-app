import 'package:json_annotation/json_annotation.dart';
import 'package:nuconta_marketplace/application/models/models.dart';
import 'package:nuconta_marketplace/domain/entities/entities.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel {
  OfferModel({
    this.id,
    this.price,
    this.product,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  final String? id;
  final int? price;
  final ProductModel? product;

  OfferEntity toEntity() => OfferEntity(
        id: id,
        price: price,
        product: product?.toEntity(),
      );
}
