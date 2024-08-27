import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class GetAllProductsLoading extends ProductState {}

class GetAllProductsSuccess extends ProductState {
  final List<ProductEntity> products;

  const GetAllProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class GetAllProductsError extends ProductState {
  final String message;

  const GetAllProductsError(this.message);

  @override
  List<Object> get props => [message];
}

class GetProductLoading extends ProductState {}

class GetProductSuccess extends ProductState {
  final ProductEntity product;

  const GetProductSuccess(this.product);

  @override
  List<Object> get props => [product];
}

class GetProductError extends ProductState {
  final String message;

  const GetProductError(this.message);

  @override
  List<Object> get props => [message];
}

