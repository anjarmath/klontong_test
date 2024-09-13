import 'package:klontong_management/core/error/exception.dart';
import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/feature/data/source/remote_source.dart';
import 'package:klontong_management/feature/domain/entity/category.dart';
import 'package:klontong_management/feature/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final KlontongRemoteDataSource _source;

  CategoryRepositoryImpl(this._source);

  @override
  Future<(bool, Failure?)> createCategory(String name) async {
    try {
      Map<String, dynamic> category = {
        "categoryName": name,
      };
      final res = await _source.createCategory(category);
      return (res, null);
    } on ServerException {
      return (false, ServerFailure());
    }
  }

  @override
  Future<(List<KlontongCategory>, Failure?)> getCategory() async {
    try {
      final res = await _source.getCategory();
      return (res, null);
    } on ServerException {
      return (<KlontongCategory>[], ServerFailure());
    }
  }
}
