import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/cart_item.dart';
import '../../models/product_item.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  RxList<CartItem> cartProducts = <CartItem>[].obs;
  List<Product> allProducts = [];
  RxDouble totalPrice = 0.0.obs;

  bool get isEmptyCart => cartProducts.isEmpty;

  @override
  void onInit() {
    super.onInit();
    ever(cartProducts, (_) {
      calculateTotalPrice();
      print("Le panier a changé, prix recalculé !");
    });
  }

  void calculateTotalPrice() {
    totalPrice.value = cartProducts.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  void removeFromCart(CartItem item) {
    cartProducts.remove(item);
  }

  void increaseItemQuantity(CartItem item) {
    item.quantity++;

    cartProducts.refresh();
  }

  void decreaseItemQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      cartProducts.remove(item);
    }

    cartProducts.refresh();
  }

  void processCheckout() async {
    if (isEmptyCart) return;

    isLoading.value = true;
    isLoading.value = false;
  }
}
