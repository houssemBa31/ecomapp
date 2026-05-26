import 'package:ecomapp/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theming/color.dart';
import '../../core/widget/cart_item.dart';
import '../../view_modele/controller/cart_controller.dart';

// Icônes SVG de secours (remplacez par vos variables globales si existantes)
const String trashIcon = '<svg>...</svg>';
const String receiptIcon = '<svg>...</svg>';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recommandé avec GetX : Trouver le contrôleur directement dans le build
    final CartController controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            const Text("Your Cart", style: TextStyle(color: AppColors.black)),
            Obx(
              () => Text(
                "${controller.cartProducts.length} items",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.cartProducts.length,
            itemBuilder: (context, index) {
              final item = controller.cartProducts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  // Clé unique basée sur l'identifiant du produit
                  key: Key("cart_${item.product.id}"),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    controller.removeFromCart(item);
                    Get.snackbar(
                      "Panier",
                      "${item.product.title} a été supprimé.",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },

                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColors.white2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete_outline, color: AppColors.red),
                      ],
                    ),
                  ),
                  child: CartCard(cart: item),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}

class CartCard extends StatelessWidget {
  final CartItem cart;

  const CartCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              // Pensez à utiliser Image.asset ou CachedNetworkImage si nécessaire
              child: Image.network(
                cart.product.images.isNotEmpty ? cart.product.images[0] : '',
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: const TextStyle(color: AppColors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(8),
              Text.rich(
                TextSpan(
                  // Affiche le prix unitaire du produit plutôt que le total global
                  text: "\$${cart.product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                  children: [
                    TextSpan(
                      text: " x${cart.quantity}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withValues(alpha: 0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.receipt_long,
                    color: AppColors.orange,
                  ),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.black,
                ),
              ],
            ),
            verticalSpace(16),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            // Ajout de .value pour écouter correctement la variable réactive
                            text: "\$${controller.totalPrice.value}",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.processCheckout();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.orange,
                      foregroundColor: AppColors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    child: const Text("Check Out"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming...";
