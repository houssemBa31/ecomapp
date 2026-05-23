// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  colors: (json['colors'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  rating: (json['rating'] as num).toDouble(),
  price: (json['price'] as num).toDouble(),
  isPopular: json['isPopular'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
  type: $enumDecode(_$ProductTypeEnumMap, json['type']),
  off: (json['off'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'images': instance.images,
  'colors': instance.colors,
  'rating': instance.rating,
  'price': instance.price,
  'isPopular': instance.isPopular,
  'isFavorite': instance.isFavorite,
  'type': _$ProductTypeEnumMap[instance.type]!,
  'off': instance.off,
  'quantity': instance.quantity,
};

const _$ProductTypeEnumMap = {
  ProductType.all: 'all',
  ProductType.electronics: 'electronics',
  ProductType.clothing: 'clothing',
  ProductType.books: 'books',
  ProductType.parfum: 'parfum',
};
