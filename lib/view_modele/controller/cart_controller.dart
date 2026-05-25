import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/widget/cartItem.dart';
import '../../core/widget/product_item.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  RxList<CartItem> cartProducts = <CartItem>[].obs;
  List<Product> allProducts = [];
  var products = <Product>[].obs;
  RxDouble totalPrice = 0.0.obs;

  bool get isEmptyCart => cartProducts.isEmpty;

  void removeFromCart(CartItem item) {
    cartProducts.remove(item);
    calculateTotalPrice();
  }

  void increaseItemQuantity(CartItem item) {
    item.quantity++;

    cartProducts.refresh();

    calculateTotalPrice();
  }

  void decreaseItemQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      cartProducts.remove(item);
    }

    cartProducts.refresh();

    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice.value = 0;

    for (var element in cartProducts) {
      totalPrice.value += element.product.price * element.quantity;
    }
    void removeFromCart(CartItem item) {
      cartProducts.remove(item);

      calculateTotalPrice();
    }
  }

  void processCheckout() async {
    if (isEmptyCart) return;

    isLoading.value = true;
    isLoading.value = false;

    // Exemple : Get.to(() => DeliveryPage());
  }
}
