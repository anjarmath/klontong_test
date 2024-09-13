import 'package:klontong_management/feature/domain/repository/category_repository.dart';
import 'package:klontong_management/feature/domain/repository/product_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  ProductRepository,
  CategoryRepository,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
