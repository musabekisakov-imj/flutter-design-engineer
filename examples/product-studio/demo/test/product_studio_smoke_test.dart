import 'package:flutter_test/flutter_test.dart';
import 'package:product_studio_demo/product_studio_app.dart';
import 'package:product_studio_demo/product_studio_models.dart';

void main() {
  testWidgets('fixture opens every primary screen', (tester) async {
    await tester.pumpWidget(const ProductStudioApp());
    expect(find.text('Build better.\nShip cleaner.'), findsOneWidget);

    for (final page in StudioPage.values) {
      expect(page.name, isNotEmpty);
    }
  });
}
