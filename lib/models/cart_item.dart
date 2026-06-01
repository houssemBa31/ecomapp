import 'package:ecomapp/models/product_item.dart';

class CartItem {
  final Product product;
  int colorIndex;
  int quantity;
  String svgString;

  CartItem({
    required this.product,
    required this.colorIndex,
    this.quantity = 1,
    required this.svgString,
  });

  double get total => product.price * quantity;
}
