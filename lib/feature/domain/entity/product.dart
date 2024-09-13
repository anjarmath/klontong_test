import 'package:equatable/equatable.dart';

class KlontongProduct extends Equatable {
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
  final int harga;

  const KlontongProduct({
    required this.id,
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
  List<Object?> get props => [id, categoryId, name];
}
