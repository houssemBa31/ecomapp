import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/theming/color.dart';
import '../../../core/theming/spacing.dart';
import '../../../view_modele/controller/auth_controller.dart';
import '../../sign_up/sign_up.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Champ Email
        TextFormField(
          onChanged: (value) => controller.email.value = value,
          decoration: const InputDecoration(
            labelText: "Email",
            suffixIcon: Icon(Icons.email_outlined),
            border: authOutlineInputBorder,
          ),
        ),
        verticalSpace(20),

        // Champ Password avec OBX
        // Line 34-51: Fix spacing
        Obx(
          () => TextFormField(
            obscureText: controller.isPasswordHidden.value,
            onChanged: (value) => controller.password.value = value,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordHidden.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () => controller.isPasswordHidden.toggle(),
              ),
              border: authOutlineInputBorder,
            ),
          ),
        ),

        // Line 56-75: Fix spacing
        Obx(
          () => ElevatedButton(
            onPressed: controller.isLoading.value
                ? null
                : () => controller.signIn(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orange,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: controller.isLoading.value
                ? const CircularProgressIndicator(color: AppColors.white)
                : const Text(
                    "Continue",
                    style: TextStyle(color: AppColors.white),
                  ),
          ),
        ),

        verticalSpace(30),

        // Bouton Continue avec OBX pour le loader
        Obx(
          () => ElevatedButton(
            onPressed: controller.isLoading.value
                ? null
                : () => controller.signIn(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orange,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: controller.isLoading.value
                ? const CircularProgressIndicator(color: AppColors.white)
                : const Text(
                    "Continue",
                    style: TextStyle(color: AppColors.white),
                  ),
          ),
        ),
      ],
    );
  }
}
