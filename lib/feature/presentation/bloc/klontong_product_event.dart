import 'package:equatable/equatable.dart';

abstract class KlontongProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetKlontongProductById extends KlontongProductEvent {
  final String id;

  GetKlontongProductById(this.id);

  @override
  List<Object?> get props => [id];
}

class UpdateKlontongProduct extends KlontongProductEvent {
  final String id;
  final String categoryId;
  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final double weight;
  final double width;
  final double length;
  final double height;
  final String image;
  final double harga;

  UpdateKlontongProduct(
    this.id, {
    required this.categoryId,
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.harga,
  });

  @override
  List<Object?> get props => [id, name];
}

class DeleteKlontongProduct extends KlontongProductEvent {
  final String id;

  DeleteKlontongProduct(this.id);

  @override
  List<Object?> get props => [id];
}
