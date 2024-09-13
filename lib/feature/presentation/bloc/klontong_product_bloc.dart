import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_management/feature/domain/usecase/delete_product.dart';
import 'package:klontong_management/feature/domain/usecase/get_product_by_id.dart';
import 'package:klontong_management/feature/domain/usecase/update_product.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_event.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_state.dart';

class KlontongProductBloc
    extends Bloc<KlontongProductEvent, KlontongProductState> {
  final GetProductById _getProductById;
  final UpdateProduct _updateProduct;
  final DeleteProduct _deleteProduct;

  KlontongProductBloc(
      {required GetProductById getProductById,
      required UpdateProduct updateProduct,
      required DeleteProduct deleteProduct})
      : _getProductById = getProductById,
        _updateProduct = updateProduct,
        _deleteProduct = deleteProduct,
        super(Empty()) {
    on<GetKlontongProductById>(_getKlontongProductHandler);
    on<UpdateKlontongProduct>(_updateProductsHandler);
    on<DeleteKlontongProduct>(_deleteKlontongProductHandler);
  }

  Future<void> _getKlontongProductHandler(
      GetKlontongProductById event, Emitter<KlontongProductState> emit) async {
    emit(Loading());
    final res = await _getProductById(GetProductByIdParams(id: event.id));
    if (res.$2 != null) {
      emit(Error("Oops! Error"));
      return;
    }

    emit(Loaded(res.$1!));
    return;
  }

  Future<void> _updateProductsHandler(
      UpdateKlontongProduct event, Emitter<KlontongProductState> emit) async {
    emit(Updating());
    final res = await _updateProduct(
      UpdateProductParams(
        event.id,
        categoryId: event.categoryId,
        categoryName: event.categoryName,
        sku: event.sku,
        name: event.name,
        description: event.description,
        weight: event.weight,
        width: event.width,
        length: event.length,
        height: event.height,
        image: event.image,
        harga: event.harga,
      ),
    );
    if (res.$2 != null) {
      emit(Error("Oops! Error"));
    } else {
      emit(Updated());
    }

    add(GetKlontongProductById(event.id));
  }

  Future<void> _deleteKlontongProductHandler(
      DeleteKlontongProduct event, Emitter<KlontongProductState> emit) async {
    emit(Deleting());
    final res = await _deleteProduct(DeleteProductParams(id: event.id));
    if (res.$2 != null) {
      emit(Error("Oops! Error"));
    } else {
      emit(Deleted());
    }

    add(GetKlontongProductById(event.id));
  }
}
