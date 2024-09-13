import 'package:klontong_management/core/error/failure.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';
import 'package:klontong_management/feature/domain/repository/product_repository.dart';

class GetProducts implements UseCase<List<KlontongProduct>, NoParams> {
  final ProductRepository _repository;

  GetProducts(this._repository);

  @override
  Future<(List<KlontongProduct>, Failure?)> call(NoParams params) {
    return _repository.getProducts();
  }
}
