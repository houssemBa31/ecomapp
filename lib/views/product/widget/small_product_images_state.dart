import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theming/color.dart';
import '../../../view_modele/controller/product_controller.dart';

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
  State<SmallProductImage> createState() => SmallProductImageState(); // 1. Supprimé le "_" ici
}

// 2. Déplacé ici et supprimé le "_" pour rendre la classe d'état publique
class SmallProductImageState extends State<SmallProductImage> {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
              // 3. Correction : Remplacement de .withAlpha(0.1 as int) par une opacité correcte
              color: widget.isSelected
                  ? AppColors.orange
                  : AppColors.orange.withOpacity(0.1),
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
