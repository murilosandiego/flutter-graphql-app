import 'package:json_annotation/json_annotation.dart';
import 'package:nuconta_marketplace/domain/entities/entities.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  final String? id;
  final String? name;
  final String? description;
  final String? image;

  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: name,
        description: description,
        image: image,
      );
}
