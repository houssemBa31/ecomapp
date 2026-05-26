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
    GetPage<dynamic>(name: AppRoutes.homeScreen, page: () => HomeScreen()),

    GetPage<dynamic>(
      name: AppRoutes.favoriteProductsScreen,
      page: () => FavoriteProductsScreen(),
    ),

    GetPage<dynamic>(name: AppRoutes.cartScreen, page: () => CartScreen()),

    GetPage<dynamic>(name: AppRoutes.signInScreen, page: () => SignInScreen()),

    GetPage<dynamic>(
      name: AppRoutes.productDetailsScreen,
      page: () => ProductDetailsScreen(),
    ),

    GetPage<dynamic>(name: AppRoutes.signUpScreen, page: () => SignUpScreen()),
  ];
}
