class Urls {
  static const String baseUrl =  'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/66be460f71fccd1506882d24';
  
  static String getProduct(String id) => '$baseUrl/$id';


  static String getAllProducts() => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries';


}
