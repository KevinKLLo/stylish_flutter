import 'package:stylish_flutter/Model/product.dart';
import 'package:stylish_flutter/Resource/product_repository.dart';

class ProductApiProvider extends ProductProvider {
  @override
  Future<List<Product>> fetchProductList() async {
    return [
      Product(id: 1, title: 'title', price: 10),
      Product(id: 1, title: 'title', price: 10),
      Product(id: 1, title: 'title', price: 10),
      Product(id: 1, title: 'title', price: 10),
      Product(id: 1, title: 'title', price: 10),
    ];
  }
}
