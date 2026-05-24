import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/theming/color.dart';
import '../../core/widget/cartItem.dart';
import '../../core/widget/product_item.dart';
import '../../services/api/api_sevices.dart';
import '../../services/api/erreu_handler.dart';

class ProductController extends GetxController {
  final ApiService apiService = Get.find(); // Ton service Retrofit
  var isLoading = false.obs;
  List<Product> allProducts = [];
  var products = <Product>[].obs;
  RxInt currentIndex = 0.obs;
  RxList<CartItem> cartProducts = <CartItem>[].obs;
  RxList<Product> filteredProducts = <Product>[].obs;
  RxDouble totalPrice = 0.0.obs;
  var selectedColor = "".obs;
  var currentImageUrl = "".obs;


  void addToCart(Product product) {
    CartItem item = CartItem(
      product: product,
      quantity: 1,
      colorIndex: 0,
      svgString: '',
    );

    cartProducts.add(item);

  }void changeProductImageAndColor({required String imageUrl, required String colorName}) {
    currentImageUrl.value = imageUrl;
    selectedColor.value = colorName;
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

  bool isPriceOff(Product product) => product.off != null;

  void isFavorite(int index) {
    filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
    filteredProducts.refresh();
  }

  void getAllItems() {
    filteredProducts.assignAll(allProducts);
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final response = await apiService.getProducts();
      products.assignAll(products);
    } catch (e) {
      String message = ApiErrorHandler.getErrorMessage(e);

      Get.snackbar(
        "Erreur API",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: AppColors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
