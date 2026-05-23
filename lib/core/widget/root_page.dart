import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../view_modele/controller/navigation_controller.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),

        bottomNavigationBar: StylishBottomBar(
          currentIndex: controller.currentIndex.value,

          onTap: (index) {
            controller.currentIndex.value = index;
          },

          items: [
            BottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
            ),

            BottomBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text("Cart"),
            ),

            BottomBarItem(
              icon: const Icon(Icons.favorite),
              title: const Text("Favorite"),
            ),

            BottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
            ),
          ],
          option: BubbleBarOptions(
            opacity: 0.3,
            inkColor: Colors.grey,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
