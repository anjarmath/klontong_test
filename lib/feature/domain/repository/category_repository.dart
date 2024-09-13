import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/feature/domain/entity/category.dart';

abstract class CategoryRepository {
  Future<(bool, Failure?)> createCategory(String name);
  Future<(List<KlontongCategory>, Failure?)> getCategory();
}
