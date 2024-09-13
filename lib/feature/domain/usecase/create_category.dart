import 'package:equatable/equatable.dart';
import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import '../repository/category_repository.dart';

class CreateCategory implements UseCase<bool, CreateCategoryParams> {
  final CategoryRepository _repository;

  CreateCategory(this._repository);

  @override
  Future<(bool, Failure?)> call(CreateCategoryParams params) {
    return _repository.createCategory(params.name);
  }
}

class CreateCategoryParams extends Equatable {
  final String name;

  const CreateCategoryParams(this.name);

  @override
  List<Object?> get props => [name];
}
