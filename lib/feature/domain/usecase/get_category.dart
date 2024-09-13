import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import 'package:klontong_management/feature/domain/entity/category.dart';
import 'package:klontong_management/feature/domain/repository/category_repository.dart';

class GetCategory implements UseCase<List<KlontongCategory>, NoParams> {
  final CategoryRepository _repository;

  GetCategory(this._repository);

  @override
  Future<(List<KlontongCategory>, Failure?)> call(NoParams params) {
    return _repository.getCategory();
  }
}
