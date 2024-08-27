import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


// Event classes
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductEvent {}

class GetProductEvent extends ProductEvent {
  final String productId;

  const GetProductEvent(this.productId);

  @override
  List<Object> get props => [productId];
}