import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/remote_data_source.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({
    required this.productRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final productModels = await productRemoteDataSource.getAllProducts();
      final products = productModels.map((model) => model.toEntity()).toList();
      return Right(products);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(NetworkFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(String id) async {
    try {
      final productModel = await productRemoteDataSource.getProduct(id);
      return Right(productModel.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(NetworkFailure('Failed to connect to the network'));
    }
  }
  

}