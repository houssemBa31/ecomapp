import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;

  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  var email = "".obs;
  var password = "".obs;
  var firstName = "".obs;
  var lastName = "".obs;
  var phoneNumber = "".obs;
  var address = "".obs;

  Future<void> signIn() async {
    if (!_validateFields()) return;

    try {
      isLoading.value = true;
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email.value.trim(),
        password: password.value.trim(),
      );

      if (res.session != null) {
        Get.offAllNamed('/home');
      }
    } on AuthException catch (e) {
      Get.snackbar("Erreur", e.message, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Erreur", "Problème de connexion réseau");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp() async {
    if (!_validateFields(isSignUp: true)) return;

    try {
      isLoading.value = true;

      final AuthResponse res = await supabase.auth.signUp(
        email: email.value.trim(),
        password: password.value.trim(),
        // Stockage des infos profil dans metadata Supabase
        data: {
          'first_name': firstName.value,
          'last_name': lastName.value,
          'phone': phoneNumber.value,
          'address': address.value,
        },
      );

      if (res.user != null) {
        Get.defaultDialog(
          title: "Succès",
          middleText:
              "Veuillez confirmer votre email pour activer votre compte.",
          onConfirm: () => Get.offAllNamed('/login'),
          textConfirm: "Aller au Login",
        );
      }
    } on AuthException catch (e) {
      Get.snackbar("Erreur", e.message, snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // --- LOGOUT ---
  Future<void> signOut() async {
    await supabase.auth.signOut();
    Get.offAllNamed('/login');
  }

  // --- VALIDATION SIMPLE ---
  bool _validateFields({bool isSignUp = false}) {
    if (!GetUtils.isEmail(email.value)) {
      Get.snackbar("Format invalide", "Veuillez entrer un email correct");
      return false;
    }
    if (password.value.length < 6) {
      Get.snackbar(
        "Sécurité",
        "Le mot de passe doit faire au moins 6 caractères",
      );
      return false;
    }
    if (isSignUp && firstName.value.isEmpty) {
      Get.snackbar("Profil", "Le prénom est obligatoire");
      return false;
    }
    return true;
  }
}
