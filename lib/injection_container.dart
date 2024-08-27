  import 'package:get_it/get_it.dart';
  import 'package:http/http.dart' as http;
  import 'package:internet_connection_checker/internet_connection_checker.dart';
  import 'package:shared_preferences/shared_preferences.dart';

import '../core/util/input_convertor.dart';
import 'product/data/data_sources/local_data_source.dart';
import 'product/data/data_sources/remote_data_source.dart';
import 'product/data/repositories/product_repository_impl.dart';
import 'product/domain/repositories/product_repository.dart';
import 'product/domain/usecases/getProduct.dart';
import 'product/domain/usecases/get_all_products_.dart';
import 'product/presentation/bloc/product_bloc.dart';





  final sl = GetIt.instance;

  Future<void> init() async {
    // External Dependencies
    final sharedPreferences = await SharedPreferences.getInstance();
    print('SharedPreferences instance created: $sharedPreferences');
    sl.registerLazySingleton(() => sharedPreferences);

    sl.registerLazySingleton(() => InternetConnectionChecker());
    print('InternetConnectionChecker registered');

    sl.registerLazySingleton(() => http.Client());
    print('Http Client registered');

    sl.registerLazySingleton(() => InputConvertor());
    print('InputConvertor registered');

    // Data Sources
    sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()),
    );
    print('ProductRemoteDataSource registered');

    sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
    );
    print('ProductLocalDataSource registered');


    // Repository
    sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: sl()),
    );
    print('ProductRepository registered');

    
    // Use Cases
    

    sl.registerLazySingleton(() => GetAllProductUseCase(sl()));
    print('GetAllProdcutsUsecase registered');

    sl.registerLazySingleton(() => GetProductUseCase(sl()));
    print('GetProductUseCase registered');


  

    // Blocs
    sl.registerFactory(() => ProductBloc(
          getAllProductUseCase: sl(),
     
          getProductUseCase: sl(),
        ));
    print('ProductBloc registered');

  

    // Core
    // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  }
