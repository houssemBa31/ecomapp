import 'package:ecomapp/core/widget/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../core/widget/product_category.dart';
import '../../core/widget/product_item.dart';
import '../../models/api/api_sevices.dart';
import '../../models/api/erreu_handler.dart';

class ProductController extends GetxController {
  final ApiService apiService = Get.find(); // Ton service Retrofit
  var isLoading = false.obs;
  List<Product> allProducts = [];
  var products = <Product>[].obs;
  RxInt selectedCategoryIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  RxList<Product> filteredProducts = <Product>[].obs;
  RxList<CartItem> cartProducts = <CartItem>[].obs;
  RxList<ProductCategory> categories = <ProductCategory>[].obs;
  RxDouble totalPrice = 0.0.obs;

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }

    categories[index].isSelected = true;
    selectedCategoryIndex.value = index;

    if (categories[index].type == ProductType.all) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts
            .where((item) => item.type == categories[index].type)
            .toList(),
      );
    }

    categories.refresh();
  }

  void isFavorite(int index) {
    filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
    filteredProducts.refresh();
  }

  void addToCart(Product product) {
    CartItem item = CartItem(
      product: product,
      quantity: 1,
      colorIndex: 0,
      svgString: '',
    );

    cartProducts.add(item);

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

  bool isPriceOff(Product product) => product.off != null;

  bool get isEmptyCart => cartProducts.isEmpty;

  void calculateTotalPrice() {
    totalPrice.value = 0;

    for (var element in cartProducts) {
      totalPrice.value += element.product.price * element.quantity;
    }
  }

  getFavoriteItems() {
    filteredProducts.assignAll(allProducts.where((item) => item.isFavorite));
  }

  void removeFromCart(CartItem item) {
    cartProducts.remove(item);

    calculateTotalPrice();
  }

  getAllItems() {
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

      // Appel Retrofit
      final response = await apiService.getProducts();
      products.assignAll(products);
    } catch (e) {
      // ON UTILISE LE HANDLER ICI
      String message = ApiErrorHandler.getErrorMessage(e);

      Get.snackbar(
        "Erreur API",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
