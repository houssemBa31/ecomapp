import 'package:ecomapp/views/product/widget/round_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/theming/color.dart';
import '../../../models/product_item.dart';
import '../../../view_modele/controller/product_controller.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    int selectedColor = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() {
        return Row(
          children: [
            ...List.generate(
              product.colors.length,
              (index) => ColorDot(
                color: product.colors[index],
                isSelected: index == selectedColor,
              ),
            ),
            const Spacer(),
            RoundedIconBtn(icon: Icons.remove, press: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                controller.selectedColor.value,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            RoundedIconBtn(icon: Icons.add, showShadow: true, press: () {}),
          ],
        );
      }),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, this.isSelected = false});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: isSelected ? AppColors.orange : Colors.transparent,
        ),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
