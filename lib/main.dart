import 'package:catbreeds_app/core/constants/api_constants.dart';
import 'package:catbreeds_app/data/datasources/cat_api_service.dart';
import 'package:catbreeds_app/data/repositories/cat_breed_repository_impl.dart';
import 'package:catbreeds_app/domain/usecases/get_cat_breeds.dart';
import 'package:catbreeds_app/presentation/providers/cat_breed_provider.dart';
import 'package:catbreeds_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final catApiService = CatApiService();
    final catBreedRepository = CatBreedRepositoryImpl(catApiService);
    final getCatBreedsUseCase = GetCatBreedsUseCase(catBreedRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CatBreedProvider(getCatBreedsUseCase),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: !IS_PROD,
        title: 'Cat Breeds',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
