import 'package:flutter/animation.dart';

enum ProductType { all, electronics, clothing, books, parfum }

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final double price;
  final bool isPopular;
  int _quantity = 0;

  int get quantity => _quantity;
  final ProductType type;
  bool isFavorite;

  double? off;

  set quantity(int newQuantity) {
    if (newQuantity >= 0) _quantity = newQuantity;
  }

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.type,
    required this.off,
    required this.isFavorite,
    required this.rating,
  });
}
