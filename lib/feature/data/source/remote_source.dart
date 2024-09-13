import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:klontong_management/core/constant.dart';
import 'package:klontong_management/core/error/exception.dart';
import 'package:klontong_management/feature/data/model/category_model.dart';
import 'package:klontong_management/feature/data/model/product_model.dart';

abstract class KlontongRemoteDataSource {
  Future<bool> createProduct(Map<String, dynamic> klontong);
  Future<List<KlontongProductModel>> getProducts();
  Future<KlontongProductModel> getProductById(String id);
  Future<bool> updateProduct(String id, Map<String, dynamic> klontong);
  Future<bool> deleteProduct(String id);

  Future<bool> createCategory(Map<String, dynamic> category);
  Future<List<KlontongCategoryModel>> getCategory();
}

class KlontongRemoteDataSourceImpl implements KlontongRemoteDataSource {
  final http.Client client;
  KlontongRemoteDataSourceImpl(this.client);

  @override
  Future<bool> createProduct(Map<String, dynamic> klontong) async {
    final response = await client.post(
      Uri.parse("$kBaseAPIUrl/klontong"),
      body: klontong,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteProduct(String id) async {
    final response = await client.delete(
      Uri.parse("$kBaseAPIUrl/klontong/$id"),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<KlontongProductModel> getProductById(String id) async {
    final response = await client.get(
      Uri.parse("$kBaseAPIUrl/klontong/$id"),
    );

    if (response.statusCode == 200) {
      return KlontongProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<KlontongProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse("$kBaseAPIUrl/klontong"),
    );

    if (response.statusCode == 200) {
      List<dynamic> resBody = jsonDecode(response.body);
      List<KlontongProductModel> productList =
          resBody.map((json) => KlontongProductModel.fromJson(json)).toList();
      return productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> updateProduct(String id, Map<String, dynamic> klontong) async {
    final response = await client.put(
      Uri.parse("$kBaseAPIUrl/klontong/$id"),
      body: klontong,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> createCategory(Map<String, dynamic> category) async {
    final response = await client.post(
      Uri.parse("$kBaseAPIUrl/category"),
      body: category,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<KlontongCategoryModel>> getCategory() async {
    final response = await client.get(
      Uri.parse("$kBaseAPIUrl/category"),
    );

    if (response.statusCode == 200) {
      List<dynamic> resBody = jsonDecode(response.body);
      List<KlontongCategoryModel> categoryList =
          resBody.map((json) => KlontongCategoryModel.fromJson(json)).toList();
      return categoryList;
    } else {
      throw ServerException();
    }
  }
}
