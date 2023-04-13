import 'dart:convert';

import 'package:stylish_flutter/Model/product.dart';
import 'package:stylish_flutter/Resource/product_repository.dart';
import 'package:dio/dio.dart';

class ProductApiProvider extends ProductProvider {
  final dio = Dio();

  @override
  Future<List<Product>> fetchProductList() async {
    final response =
        await dio.get('https://api.appworks-school.tw/api/1.0/products/women');

    final productList = _decodeProductListFromResponse(response);

    return productList.data;
  }

  ProductList _decodeProductListFromResponse(Response<dynamic> response) {
    final jsonMap = jsonDecode(response.toString());

    final productList = ProductList(
      data: List.from(jsonMap['data']).map((jsonProduct) {
        final colors = List.from(jsonProduct['colors'])
            .map((jsonColor) => Color(
                  code: jsonColor['code'],
                  name: jsonColor['name'],
                ))
            .toList();
        final sizes = List.from(jsonProduct['sizes']).cast<String>();
        final variants = List.from(jsonProduct['variants'])
            .map((jsonVariant) => Variant(
                  colorCode: jsonVariant['color_code'],
                  size: jsonVariant['size'],
                  stock: jsonVariant['stock'],
                ))
            .toList();
        return Product(
          id: jsonProduct['id'],
          category: jsonProduct['category'],
          title: jsonProduct['title'],
          description: jsonProduct['description'],
          price: jsonProduct['price'],
          texture: jsonProduct['texture'],
          wash: jsonProduct['wash'],
          place: jsonProduct['place'],
          note: jsonProduct['note'],
          story: jsonProduct['story'],
          colors: colors,
          sizes: sizes,
          variants: variants,
          mainImage: jsonProduct['main_image'],
          images: List.from(jsonProduct['images']).cast<String>(),
        );
      }).toList(),
      nextPaging: jsonMap['next_paging'],
    );

    return productList;
  }
}
