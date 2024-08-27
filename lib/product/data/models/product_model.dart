import '../../domain/entities/product.dart';

class OptionModel {
  final String id;
  final String name;
  final double price;

  OptionModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  OptionEntity toEntity() {
    return OptionEntity(
      id: id,
      name: name,
      price: price,
    );
  }

  // Method to create an OptionModel instance from local JSON
  factory OptionModel.forLocalJson(Map<String, dynamic> json) {
    return OptionModel.fromJson(json);
  }
}

class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<OptionModel> options;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var optionsFromJson = json['options'] as List;
    List<OptionModel> optionsList = optionsFromJson.isNotEmpty
        ? optionsFromJson.map((option) => OptionModel.fromJson(option)).toList()
        : [];

    return ProductModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      description: json['description'],
      options: optionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      discount: discount,
      description: description,
      options: options.map((option) => option.toEntity()).toList(),
    );
  }

  // Method to create a ProductModel instance from local JSON
  factory ProductModel.forLocalJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }
}
