import 'package:equatable/equatable.dart';
import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/core/usecase/usecase.dart';

import '../repository/product_repository.dart';

class CreateProduct implements UseCase<bool, CreateProductParams> {
  final ProductRepository _repository;

  CreateProduct(this._repository);

  @override
  Future<(bool, Failure?)> call(CreateProductParams params) {
    return _repository.createProduct(
        categoryId: params.categoryId,
        categoryName: params.categoryName,
        sku: params.sku,
        name: params.name,
        description: params.description,
        weight: params.weight,
        width: params.width,
        length: params.length,
        height: params.height,
        image: params.image,
        harga: params.harga);
  }
}

class CreateProductParams extends Equatable {
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

  const CreateProductParams({
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
  List<Object?> get props => [name];
}
