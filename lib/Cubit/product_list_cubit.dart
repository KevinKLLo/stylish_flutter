import 'package:bloc/bloc.dart';
import 'package:stylish_flutter/Model/product.dart';
import 'package:stylish_flutter/Resource/product_repository.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductRepository _repository = ProductRepository();

  ProductListCubit() : super(ProductListLoading());

  Future<void> fetchProductList() async {
    List<Product> postList = await _repository.fetchProductList;
    emit(ProductListSuccess(postList));
  }
}

abstract class ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListSuccess extends ProductListState {
  final List<Product> productList;
  ProductListSuccess(this.productList);
}
