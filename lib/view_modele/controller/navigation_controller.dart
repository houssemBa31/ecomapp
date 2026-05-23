import 'package:ecomapp/views/cart/cart.dart';
import 'package:ecomapp/views/home/home_page.dart';
import 'package:ecomapp/views/sign_In/sign_in.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../views/favorite/favorits.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  final pages = [
    HomeScreen(),
    FavoriteProductsScreen(),
    CartScreen(),
    SignInScreen(),
  ];
}