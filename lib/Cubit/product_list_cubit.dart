import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_flutter/Model/product.dart';
import 'package:stylish_flutter/Resource/product_repository.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductRepository _repository = ProductRepository();

  ProductListCubit() : super(ProductListLoading());

  void fetchProductList() async {
    List<Product> postList = await _repository.fetchProductLists();

    emit(ProductListSuccess(postList));
  }
}

abstract class ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListSuccess extends ProductListState {
  final List<Product> productList;
  ProductListSuccess(this.productList);
}
