import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import 'package:klontong_management/feature/domain/usecase/create_product.dart';
import 'package:klontong_management/feature/domain/usecase/get_products.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_list_event.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_list_state.dart';

class KlontongProductListBloc
    extends Bloc<KlontongProductListEvent, KlontongProductListState> {
  final GetProducts _getProducts;
  final CreateProduct _createProduct;

  KlontongProductListBloc(
      {required GetProducts getProducts, required CreateProduct createProduct})
      : _getProducts = getProducts,
        _createProduct = createProduct,
        super(Empty()) {
    on<GetKlontongProducts>(_getProductsHandler);
    on<CreateKlontongProduct>(_createProductsHandler);
  }

  Future<void> _getProductsHandler(
      GetKlontongProducts event, Emitter<KlontongProductListState> emit) async {
    emit(Loading());
    final res = await _getProducts(NoParams());
    if (res.$2 != null) {
      emit(Error("Oops! Error"));
      return;
    }

    emit(Loaded(res.$1));
    return;
  }

  Future<void> _createProductsHandler(CreateKlontongProduct event,
      Emitter<KlontongProductListState> emit) async {
    emit(Creating());
    final res = await _createProduct(
      CreateProductParams(
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
      emit(Created());
    }

    add(GetKlontongProducts());
  }
}
