import 'package:ecomapp/view_modele/controller/controler.dart';
import 'package:ecomapp/views/cart/cart.dart';
import 'package:ecomapp/views/favorit/favorits.dart';
import 'package:ecomapp/views/home/home_page.dart';
import 'package:ecomapp/views/sign_In/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/widget/Api.dart';

void main() async  {

  Get.put(ProductController());
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://your-p',
    anonKey: 'your-',
  );
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

   MyApp({super.key});
  final List<Widget> pages = [
    HomeScreen(),
    FavoriteProductsScreen(),
    CartScreen(),
    SignInScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar:
      Obx(() =>
          StylishBottomBar(
            currentIndex:controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
              },
            items: AppData.bottomNavBarItems.map(
                  (item) => BottomBarItem(
                backgroundColor: item!.activeColor,
                icon: item.icon,
                title: Text(
                  item.title,
                  style: TextStyle(
                    color: item.activeColor,
                  ),
                ),
              ),
            )
                .toList(),
            option: BubbleBarOptions(
              opacity: 0.3,
              inkColor: Colors.grey,
              borderRadius: BorderRadius.circular(
                15.0,
    ),
    )),
    ),
    ));
  }
}
