// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return CustomerModel(
    id: json['id'] as String?,
    balance: json['balance'] as int?,
    name: json['name'] as String?,
    offers: (json['offers'] as List<dynamic>?)
        ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'name': instance.name,
      'offers': instance.offers,
    };
