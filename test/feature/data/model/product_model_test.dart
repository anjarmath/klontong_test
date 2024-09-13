import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:klontong_management/feature/data/model/product_model.dart';
import 'package:klontong_management/feature/domain/entity/product.dart';

import '../../../mock/read_mock.dart';

void main() {
  const tModel = KlontongProductModel(
    id: "test",
    categoryId: "test",
    categoryName: "test",
    sku: "test",
    name: "test",
    description: "test",
    weight: 1.0,
    width: 1.0,
    length: 1.0,
    height: 1.0,
    image: "test",
    harga: 1000,
  );
  test("should be a subclass of product", () {
    expect(tModel, isA<KlontongProduct>());
  });

  group('fromJson', () {
    test(
      'should return a valid model from the JSON',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            jsonDecode(readMock('product.json'));
        // act
        final result = KlontongProductModel.fromJson(jsonMap);
        // assert
        expect(result, tModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tModel.toJson();
        // assert
        final expectedMap = {
          "_id": "test",
          "categoryId": "test",
          "categoryName": "test",
          "sku": "test",
          "name": "test",
          "description": "test",
          "weight": 1.0,
          "width": 1.0,
          "length": 1.0,
          "height": 1.0,
          "image": "test",
          "harga": 1000
        };
        expect(result, expectedMap);
      },
    );
  });
}
