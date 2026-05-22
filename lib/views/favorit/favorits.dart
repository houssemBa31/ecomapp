import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/widget/ptoduct_cart.dart';
import '../../view_modele/controller/controler.dart';

class FavoriteProductsScreen extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Favorite")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final favorites = controller.products
                .where((p) => p.isFavorite)
                .toList();

            if (favorites.isEmpty) {
              return const Center(child: Text("No favorites yet"));
            }
            return GridView.builder(
              itemCount: controller.products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => ProductCard(
                product: controller.products[index],
                onPress: () {},
              ),
            );
          }),
        ),
      ),
    );
  }
}

// Our demo Products

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
