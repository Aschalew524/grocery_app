import 'package:bloc/bloc.dart';

import '../../domain/usecases/getProduct.dart';
import '../../domain/usecases/get_all_products_.dart';
import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUseCase getAllProductUseCase;
  final GetProductUseCase getProductUseCase;

  ProductBloc({
    required this.getAllProductUseCase,
    required this.getProductUseCase,
  }) : super(ProductInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
    on<GetProductEvent>(_onGetProduct);
  }

  Future<void> _onGetAllProducts(GetAllProductsEvent event, Emitter<ProductState> emit) async {
    emit(GetAllProductsLoading());
    try {
      // Assuming the GetAllProductUseCase should not require parameters in this context
      final result = await getAllProductUseCase.execute(); 
      result.fold(
        (failure) => emit(GetAllProductsError(failure.toString())),
        (products) => emit(GetAllProductsSuccess(products)),
      );
    } catch (e) {
      emit(GetAllProductsError(e.toString()));
    }
  }

  Future<void> _onGetProduct(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(GetProductLoading());
    try {
      final result = await getProductUseCase.execute(event.productId);
      result.fold(
        (failure) => emit(GetProductError(failure.toString())),
        (product) => emit(GetProductSuccess(product)),
      );
    } catch (e) {
      emit(GetProductError(e.toString()));
    }
  }
}
