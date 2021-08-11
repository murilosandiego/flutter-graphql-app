import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? image;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
      ];
}
