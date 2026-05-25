import 'package:flutter_test/flutter_test.dart';
import 'package:ecomapp/main.dart'; // Conserve l'import de votre application

void main() {
  testWidgets('Vérification du chargement de l\'application', (WidgetTester tester) async {
    // 1. Charge votre application e-commerce
    await tester.pumpWidget(MyApp());

    // 2. Attend que l'interface se dessine complètement
    await tester.pumpAndSettle();

    // 3. Vérifie que l'application démarre sans crasher
    // (Ce test passera si MyApp() se charge correctement)
    expect(tester.takeException(), isNull);
  });
}
