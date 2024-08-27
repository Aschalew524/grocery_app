import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/error/exception.dart';

import '../models/product_model.dart';

abstract class ProductRemoteDataSource {

  getProduct(String productId) {}

  getAllProducts() {}
}
class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getProduct(String productId) async {
    final response = await client.get(Uri.parse(Urls.getProduct(productId)));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(Uri.parse(Urls.getAllProducts()));

    if (response.statusCode == 200) {
      print('Response Body: ${response.body}');
      final data = json.decode(response.body);

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final productList = data['data'] as List<dynamic>;
        print('Parsed Products: $productList'); // Debug print to inspect the list
        return productList.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }


  
}
