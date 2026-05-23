import 'package:get/get.dart';

import '../../views/cart/cart.dart';
import '../../views/favorite/favorits.dart';
import '../../views/home/home_page.dart';
import '../../views/product/product.dart';
import '../../views/sign_In/sign_in.dart';
import '../../views/sign_up/sign_up.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.HomeScreen, page: () => HomeScreen()),

    GetPage(
      name: AppRoutes.FavoriteProductsScreen,
      page: () => FavoriteProductsScreen(),
    ),

    GetPage(name: AppRoutes.CartScreen, page: () => CartScreen()),

    GetPage(name: AppRoutes.SignInScreen, page: () => SignInScreen()),

    GetPage(
      name: AppRoutes.ProductDetailsScreen,
      page: () => ProductDetailsScreen(),
    ),

    GetPage(name: AppRoutes.SignUpScreen, page: () => SignUpScreen()),
  ];
}
