import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/product_category.dart';
import '../../models/product_item.dart';

class HomeController extends GetxController {
  RxString searchQuery = "".obs;
  var isLoading = false.obs;
  List<Product> allProducts = [];
  RxList<Product> filteredProducts = <Product>[].obs;
  RxList<ProductCategory> categories = <ProductCategory>[].obs;
  RxInt selectedCategoryIndex = 0.obs;
  final recentlyAddedProducts = <Product>[].obs;

  var popularProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    debounce(searchQuery, (String query) {
      filterSearch(query);
      print("Recherche effectuée pour : $query");
    }, time: const Duration(milliseconds: 500));
  }

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
