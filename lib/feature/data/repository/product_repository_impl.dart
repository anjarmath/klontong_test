import 'package:klontong_management/core/error/exception.dart';
import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/feature/data/source/remote_source.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';
import 'package:klontong_management/feature/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final KlontongRemoteDataSource _source;

  ProductRepositoryImpl(this._source);

  @override
  Future<(bool, Failure?)> createProduct({
    required String categoryId,
    required String categoryName,
    required String sku,
    required String name,
    required String description,
    required double weight,
    required double width,
    required double length,
    required double height,
    required String image,
    required double harga,
  }) async {
    try {
      Map<String, dynamic> klontong = {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "sku": sku,
        "name": name,
        "description": description,
        "weight": weight,
        "width": width,
        "length": length,
        "height": height,
        "image": image,
        "harga": harga,
      };
      final res = await _source.createProduct(klontong);
      return (res, null);
    } on ServerException {
      return (false, ServerFailure());
    }
  }

  @override
  Future<(bool, Failure?)> deleteProduct(String id) async {
    try {
      final res = await _source.deleteProduct(id);
      return (res, null);
    } on ServerException {
      return (false, ServerFailure());
    }
  }

  @override
  Future<(KlontongProduct?, Failure?)> getProductById(String id) async {
    try {
      final res = await _source.getProductById(id);
      return (res, null);
    } on ServerException {
      return (null, ServerFailure());
    }
  }

  @override
  Future<(List<KlontongProduct>, Failure?)> getProducts() async {
    try {
      final res = await _source.getProducts();
      return (res, null);
    } on ServerException {
      return (<KlontongProduct>[], ServerFailure());
    }
  }

  @override
  Future<(bool, Failure?)> updateProduct(
    String id, {
    required String categoryId,
    required String categoryName,
    required String sku,
    required String name,
    required String description,
    required double weight,
    required double width,
    required double length,
    required double height,
    required String image,
    required double harga,
  }) async {
    try {
      Map<String, dynamic> klontong = {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "sku": sku,
        "name": name,
        "description": description,
        "weight": weight,
        "width": width,
        "length": length,
        "height": height,
        "image": image,
        "harga": harga,
      };
      final res = await _source.updateProduct(id, klontong);
      return (res, null);
    } on ServerException {
      return (false, ServerFailure());
    }
  }
}
