import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:klontong_management/feature/data/repository/category_repository_impl.dart';
import 'package:klontong_management/feature/data/repository/product_repository_impl.dart';
import 'package:klontong_management/feature/data/source/remote_source.dart';
import 'package:klontong_management/feature/domain/repository/category_repository.dart';
import 'package:klontong_management/feature/domain/repository/product_repository.dart';
import 'package:klontong_management/feature/domain/usecase/create_category.dart';
import 'package:klontong_management/feature/domain/usecase/create_product.dart';
import 'package:klontong_management/feature/domain/usecase/delete_product.dart';
import 'package:klontong_management/feature/domain/usecase/get_category.dart';
import 'package:klontong_management/feature/domain/usecase/get_product_by_id.dart';
import 'package:klontong_management/feature/domain/usecase/get_products.dart';
import 'package:klontong_management/feature/domain/usecase/update_product.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_category_bloc.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_bloc.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_list_bloc.dart';

final sl = GetIt.instance;

void setupInjection() {
  sl.registerFactory(
    () => KlontongCategoryBloc(
      getCategory: sl(),
      createCategory: sl(),
    ),
  );

  sl.registerFactory(
    () => KlontongProductBloc(
      getProductById: sl(),
      updateProduct: sl(),
      deleteProduct: sl(),
    ),
  );

  sl.registerFactory(
    () => KlontongProductListBloc(
      getProducts: sl(),
      createProduct: sl(),
    ),
  );

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<KlontongRemoteDataSource>(
      () => KlontongRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()));
  sl.registerLazySingleton(() => CreateCategory(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));
  sl.registerLazySingleton(() => GetCategory(sl()));
  sl.registerLazySingleton(() => GetProductById(sl()));
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
}
