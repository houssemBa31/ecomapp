// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

  int get id;

  String get title;

  String get description;

  List<String> get images;

  List<int> get colors;

  double get rating;

  double get price;

  bool get isPopular;

  bool get isFavorite;

  ProductType get type;

  double? get off;

  int get quantity;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductCopyWith<Product> get copyWith =>
      _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality().equals(other.colors, colors) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.off, off) || other.off == off) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          id,
          title,
          description,
          const DeepCollectionEquality().hash(images),
          const DeepCollectionEquality().hash(colors),
          rating,
          price,
          isPopular,
          isFavorite,
          type,
          off,
          quantity);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, images: $images, colors: $colors, rating: $rating, price: $price, isPopular: $isPopular, isFavorite: $isFavorite, type: $type, off: $off, quantity: $quantity)';
  }


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value,
      $Res Function(Product) _then) = _$ProductCopyWithImpl;

  @useResult
  $Res call({
    int id, String title, String description, List<String> images, List<
        int> colors, double rating, double price, bool isPopular, bool isFavorite, ProductType type, double? off, int quantity
  });


}

/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? id = null, Object? title = null, Object? description = null, Object? images = null, Object? colors = null, Object? rating = null, Object? price = null, Object? isPopular = null, Object? isFavorite = null, Object? type = null, Object? off = freezed, Object? quantity = null,}) {
    return _then(_self.copyWith(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
      as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
      as String,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
      as List<String>,
      colors: null == colors
          ? _self.colors
          : colors // ignore: cast_nullable_to_non_nullable
      as List<int>,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
      as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
      as double,
      isPopular: null == isPopular
          ? _self.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
      as bool,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
      as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
      as ProductType,
      off: freezed == off
          ? _self.off
          : off // ignore: cast_nullable_to_non_nullable
      as double?,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
      as int,
    ));
  }

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  TResult Function( _Product value)? $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _Product() when $default != null:
  return $default(_that);case _:
  return orElse();

  }
  }
  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value) $default,){
  final _that = this;
  switch (_that) {
  case _Product():
  return $default(_that);case _:
  throw StateError('Unexpected subclass');

  }
  }
  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)? $default,){
  final _that = this;
  switch (_that) {
  case _Product() when $default != null:
  return $default(_that);case _:
  return null;

  }
  }
  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, String title, String description, List<String> images, List<int> colors, double rating, double price, bool isPopular, bool isFavorite, ProductType type, double? off, int quantity)? $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _Product() when $default != null:
  return $default(_that.id,_that.title,_that.description,_that.images,_that.colors,_that.rating,_that.price,_that.isPopular,_that.isFavorite,_that.type,_that.off,_that.quantity);case _:
  return orElse();

  }
  }
  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, String title, String description, List<String> images, List<int> colors, double rating, double price, bool isPopular, bool isFavorite, ProductType type, double? off, int quantity) $default,) {final _that = this;
  switch (_that) {
  case _Product():
  return $default(_that.id,_that.title,_that.description,_that.images,_that.colors,_that.rating,_that.price,_that.isPopular,_that.isFavorite,_that.type,_that.off,_that.quantity);case _:
  throw StateError('Unexpected subclass');

  }
  }
  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, String title, String description, List<String> images, List<int> colors, double rating, double price, bool isPopular, bool isFavorite, ProductType type, double? off, int quantity)? $default,) {final _that = this;
  switch (_that) {
  case _Product() when $default != null:
  return $default(_that.id,_that.title,_that.description,_that.images,_that.colors,_that.rating,_that.price,_that.isPopular,_that.isFavorite,_that.type,_that.off,_that.quantity);case _:
  return null;

  }
  }

}

/// @nodoc
@JsonSerializable()
class _Product implements Product {
  const _Product(
      {required this.id, required this.title, required this.description, required final List<
          String> images, required final List<
          int> colors, required this.rating, required this.price, this.isPopular = false, this.isFavorite = false, required this.type, this.off, this.quantity = 0})
      : _images = images,
        _colors = colors;

  factory _Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override final int id;
  @override final String title;
  @override final String description;
  final List<String> _images;

  @override List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<int> _colors;

  @override List<int> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override final double rating;
  @override final double price;
  @override
  @JsonKey()
  final bool isPopular;
  @override
  @JsonKey()
  final bool isFavorite;
  @override final ProductType type;
  @override final double? off;
  @override
  @JsonKey()
  final int quantity;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(this,);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.off, off) || other.off == off) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          id,
          title,
          description,
          const DeepCollectionEquality().hash(_images),
          const DeepCollectionEquality().hash(_colors),
          rating,
          price,
          isPopular,
          isFavorite,
          type,
          off,
          quantity);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, images: $images, colors: $colors, rating: $rating, price: $price, isPopular: $isPopular, isFavorite: $isFavorite, type: $type, off: $off, quantity: $quantity)';
  }


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value,
      $Res Function(_Product) _then) = __$ProductCopyWithImpl;

  @override
  @useResult
  $Res call({
    int id, String title, String description, List<String> images, List<
        int> colors, double rating, double price, bool isPopular, bool isFavorite, ProductType type, double? off, int quantity
  });


}

/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? id = null, Object? title = null, Object? description = null, Object? images = null, Object? colors = null, Object? rating = null, Object? price = null, Object? isPopular = null, Object? isFavorite = null, Object? type = null, Object? off = freezed, Object? quantity = null,}) {
    return _then(_Product(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
      as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
      as String,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
      as List<String>,
      colors: null == colors
          ? _self._colors
          : colors // ignore: cast_nullable_to_non_nullable
      as List<int>,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
      as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
      as double,
      isPopular: null == isPopular
          ? _self.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
      as bool,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
      as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
      as ProductType,
      off: freezed == off
          ? _self.off
          : off // ignore: cast_nullable_to_non_nullable
      as double?,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
      as int,
    ));
  }


}

// dart format on
