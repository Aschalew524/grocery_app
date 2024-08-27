import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';
import 'package:task_7/core/error/exception.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel?> getProductById(String id);
  Future<List<ProductModel>> getCachedProducts(); // Add this method
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final jsonStringList = sharedPreferences.getStringList('cachedProduct');
    if (jsonStringList != null) {
      return jsonStringList
          .map((jsonString) => ProductModel.forLocalJson(json.decode(jsonString)))
          .toList();
    } else {
      throw CacheException();
    }
  }  

  @override
  Future<ProductModel?> getProductById(String id) async {
    final jsonString = sharedPreferences.getString(id);
    if (jsonString != null) {
      return ProductModel.forLocalJson(json.decode(jsonString));
    }
    return null;
  }
  
 
  }



