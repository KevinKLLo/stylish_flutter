import 'package:stylish_flutter/Model/product.dart';
import 'package:stylish_flutter/Resource/product_api_provider.dart';

abstract class ProductProvider {
  Future<List<Product>> fetchProductList();
}

class ProductRepository {
  final ProductProvider _apiProvider = ProductApiProvider();

  Future<List<Product>> get fetchProductList => _apiProvider.fetchProductList();
}
