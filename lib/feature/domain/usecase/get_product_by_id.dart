import 'package:equatable/equatable.dart';
import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';
import 'package:klontong_management/feature/domain/repository/product_repository.dart';

class GetProductById implements UseCase<KlontongProduct, GetProductByIdParams> {
  final ProductRepository _repository;

  GetProductById(this._repository);

  @override
  Future<(KlontongProduct?, Failure?)> call(GetProductByIdParams params) {
    return _repository.getProductById(params.id);
  }
}

class GetProductByIdParams extends Equatable {
  final String id;

  const GetProductByIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}
