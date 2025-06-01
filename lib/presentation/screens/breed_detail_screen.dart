import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/presentation/providers/cat_breed_provider.dart';
import 'package:catbreeds_app/presentation/widgets/breed/breed_image.dart';
import 'package:catbreeds_app/presentation/widgets/breed/breed_info_detailed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedDetailScreen extends StatelessWidget {
  const BreedDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatBreedProvider>(context, listen: false);
    final CatBreed breed = provider.catBreedSelected!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          breed.name,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BreedImage(
              url: breed.imageUrl,
              width: double.infinity,
              height: 420,
            ),
            Expanded(
              child: BreedInfoDetailed(breed: breed),
            ),
          ],
        ),
      ),
    );
  }
}
