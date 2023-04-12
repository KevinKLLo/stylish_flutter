import 'package:stylish_flutter/Model/Product.dart';

class ProductList {
  final List<Product> data;
  final int nextPaging;

  ProductList({required this.data, required this.nextPaging});
}
