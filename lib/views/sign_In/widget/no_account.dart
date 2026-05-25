import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/theming/color.dart';
import '../../sign_up/sign_up.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: AppColors.grey),
        ),
        GestureDetector(
          onTap: () {
            Get.to<dynamic>(() => const SignUpScreen());
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: AppColors.orange),
          ),
        ),
      ],
    );
  }
}
