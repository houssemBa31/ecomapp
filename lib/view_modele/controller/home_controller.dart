import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/widget/product_category.dart';
import '../../core/widget/product_item.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var products = <Product>[].obs;
  RxInt selectedCategoryIndex = 0.obs;
  List<Product> allProducts = [];
  RxList<Product> filteredProducts = <Product>[].obs;
  RxList<ProductCategory> categories = <ProductCategory>[].obs;

  var popularProducts = <dynamic>[].obs;
  var recentlyAddedProducts = <dynamic>[].obs;

  void fetchPopularProducts() {
    var popular = allProducts
        .where((product) => product.isPopular == true)
        .toList();

    popularProducts.assignAll(popular);
  }

  void fetchRecentlyAddedProducts() {
    var recent = allProducts.reversed.take(5).toList();

    recentlyAddedProducts.assignAll(recent);
  }

  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts
            .where(
              (product) =>
                  product.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      );
    }
  }

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
}
