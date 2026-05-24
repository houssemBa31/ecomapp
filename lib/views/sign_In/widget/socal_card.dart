import 'package:flutter/cupertino.dart';

import '../../../core/theming/color.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({super.key, required this.icon, required this.press});

  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
          color: AppColors.lightWithe,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}