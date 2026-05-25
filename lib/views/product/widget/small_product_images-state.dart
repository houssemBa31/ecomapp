import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/theming/color.dart';
import '../../../view_modele/controller/product_controller.dart';

class _SmallProductImageState extends State<SmallProductImage> {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isCurrentSelected =
          controller.currentImageUrl.value == widget.image;

      return GestureDetector(
        onTap: () {
          controller.changeProductImageAndColor(
            imageUrl: widget.image,
            colorName: "Nom_Optionnel_Depuis_API",
          );

          widget.press();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.all(8),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.orange.withAlpha(0.1 as int),
              width: 1.5,
            ),
          ),
          child: Image.network(
            widget.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 20),
          ),
        ),
      );
    });
  }
}

class SmallProductImage extends StatefulWidget {
  const SmallProductImage({
    super.key,
    required this.isSelected,
    required this.press,
    required this.image,
  });

  final bool isSelected;
  final VoidCallback press;
  final String image;

  @override
  State<SmallProductImage> createState() => _SmallProductImageState();
}
