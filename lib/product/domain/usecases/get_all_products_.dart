import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetAllProductUseCase {
  final ProductRepository productRepository;

  GetAllProductUseCase(this.productRepository);

  Future<Either<Failure, List<ProductEntity>>> execute() async {
    return await productRepository.getAllProducts();
}
}