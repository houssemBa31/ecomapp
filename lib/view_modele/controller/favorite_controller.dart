import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/widget/product_item.dart';

class FavoriteController extends GetxController {
  List<Product> allProducts = [];
  RxList<Product> filteredProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    getFavoriteItems();
  }

  void getFavoriteItems() {
    filteredProducts.assignAll(allProducts.where((item) => item.isFavorite));
  }

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;

    getFavoriteItems();
  }
}
