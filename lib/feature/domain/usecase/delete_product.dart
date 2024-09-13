import 'package:equatable/equatable.dart';
import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import 'package:klontong_management/feature/domain/repository/product_repository.dart';

class DeleteProduct implements UseCase<bool, DeleteProductParams> {
  final ProductRepository _repository;

  DeleteProduct(this._repository);

  @override
  Future<(bool, Failure?)> call(DeleteProductParams params) {
    return _repository.deleteProduct(params.id);
  }
}

class DeleteProductParams extends Equatable {
  final String id;

  const DeleteProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}
