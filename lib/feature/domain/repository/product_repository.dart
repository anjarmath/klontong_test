import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';

abstract class ProductRepository {
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
  });
  Future<(List<KlontongProduct>, Failure?)> getProducts();
  Future<(KlontongProduct?, Failure?)> getProductById(String id);
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
  });
  Future<(bool, Failure?)> deleteProduct(String id);
}
