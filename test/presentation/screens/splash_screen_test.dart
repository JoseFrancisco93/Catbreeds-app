import 'package:catbreeds_app/presentation/providers/cat_breed_provider.dart';
import 'package:catbreeds_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../mocks/fake_get_cat_breeds_use_case.dart';

void main() {
  testWidgets('LandingScreen loads breeds and taps first breed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CatBreedProvider(FakeGetCatBreedsUseCase()),
        child: const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('Abyssinian'), findsOneWidget);

    await tester.tap(find.text('Abyssinian'));
    await tester.pumpAndSettle();
  });
}
