// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseResponseModel _$PurchaseResponseModelFromJson(
    Map<String, dynamic> json) {
  return PurchaseResponseModel(
    errorMessage: json['errorMessage'] as String?,
    success: json['success'] as bool?,
    customer: json['customer'] == null
        ? null
        : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PurchaseResponseModelToJson(
        PurchaseResponseModel instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'success': instance.success,
      'customer': instance.customer,
    };
