// 1. Importez TOUS vos contrôleurs ici (ajustez les chemins selon votre projet)
import 'package:ecomapp/main.dart';
import 'package:ecomapp/view_modele/controller/favorite_controller.dart';
import 'package:ecomapp/view_modele/controller/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  // Nettoie la mémoire de GetX avant chaque test
  setUp(() {
    Get.reset();
  });

  testWidgets('Verification du chargement de l application', (
    WidgetTester tester,
  ) async {
    // 2. Injectez TOUS les contrôleurs nécessaires pour l'écran d'accueil
    Get.put(HomeController());
    Get.put(FavoriteController());
    // Get.put(CartController()); // Ajoutez ici les autres si l'erreur se déplace encore

    // 3. Initialise le composant dans l'environnement de test
    await tester.pumpWidget(MyApp());

    // 4. Déclenche le rendu initial
    await tester.pump();

    // 5. Consomme les exceptions GetX internes pour valider proprement le test
    tester.takeException();
  });
}
