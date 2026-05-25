import 'package:flutter/material.dart';

import '../../../core/theming/color.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    required this.icon,
    required this.press,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 10,
              color: AppColors.lightGrey.withValues(alpha: 0.2),
            ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.orange,
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
