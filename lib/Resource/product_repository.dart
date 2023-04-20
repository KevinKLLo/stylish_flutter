import 'package:stylish_flutter/Model/product.dart';
import 'package:stylish_flutter/Resource/product_api_provider.dart';

abstract class ProductProvider {
  Future<List<Product>> fetchProductList();
}

class ProductRepository {
  final ProductProvider _apiProvider = ProductApiProvider();

  Future<List<Product>> get fetchProductList => _apiProvider.fetchProductList();

// await 會等該程式碼執行完以後，再執行後續的程式碼，等待時間比較長
  Future<List<Product>> fetchProductLists() async {
    List<Product> productList = [];
    List<Product> productList1 = await _apiProvider.fetchProductList();
    List<Product> productList2 = await _apiProvider.fetchProductList();
    List<Product> productList3 = await _apiProvider.fetchProductList();

    productList = productList1 + productList2 + productList3;
    return productList;
  }

// 以下方式修改，則可以同時打三支 api，等待時間較短
  Future<List<Product>> fetchProductLists2() async {
    List<Future<List<Product>>> futures = [
      _apiProvider.fetchProductList(),
      _apiProvider.fetchProductList(),
      _apiProvider.fetchProductList(),
    ];
    List<List<Product>> productLists = await Future.wait(futures);
    List<Product> productList = productLists.expand((list) => list).toList();
    return productList;
  }
}
