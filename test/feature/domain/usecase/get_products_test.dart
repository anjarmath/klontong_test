import 'package:flutter_test/flutter_test.dart';
import 'package:klontong_management/core/usecase/usecase.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';
import 'package:klontong_management/feature/domain/usecase/get_products.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetProducts usecase;
  late MockProductRepository repository;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetProducts(repository);
  });

  List<KlontongProduct> tProducts = [
    const KlontongProduct(
      id: "test",
      categoryId: "test",
      categoryName: "test",
      sku: "test",
      name: "test",
      description: "test",
      weight: 1,
      width: 1,
      length: 1,
      height: 1,
      image: "test",
      harga: 1000,
    )
  ];

  test("should return list of products", () async {
    when(repository.getProducts()).thenAnswer((_) async => (tProducts, null));

    final res = await usecase(NoParams());
    expect(res, (tProducts, null));
    verify(repository.getProducts());
    verifyNoMoreInteractions(repository);
  });
}
