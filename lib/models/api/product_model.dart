import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

enum ProductType { all, electronics, clothing, books, parfum }

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required String description,
    required List<String> images,
    required List<int> colors,
    required double rating,
    required double price,
    @Default(false) bool isPopular,
    @Default(false) bool isFavorite,
    required ProductType type,
    double? off,
    @Default(0) int quantity,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
