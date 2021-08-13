import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:nuconta_marketplace/application/models/customer_model.dart';

part 'purchase_response_model.g.dart';

@JsonSerializable()
class PurchaseResponseModel extends Equatable {
  const PurchaseResponseModel({
    this.errorMessage,
    this.success,
    this.customer,
  });

  factory PurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseResponseModelToJson(this);

  final String? errorMessage;
  final bool? success;
  final CustomerModel? customer;

  @override
  List<Object?> get props => [errorMessage, success, customer];
}
