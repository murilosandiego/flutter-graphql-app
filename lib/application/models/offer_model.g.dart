// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return OfferModel(
    id: json['id'] as String?,
    price: json['price'] as int?,
    product: json['product'] == null
        ? null
        : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'product': instance.product,
    };
