import 'package:catbreeds_app/core/utils/navigation_utils.dart';
import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/presentation/models/bold_text_item.dart';
import 'package:catbreeds_app/presentation/providers/cat_breed_provider.dart';
import 'package:catbreeds_app/presentation/screens/breed_detail_screen.dart';
import 'package:catbreeds_app/presentation/widgets/breed/breed_image.dart';
import 'package:catbreeds_app/presentation/widgets/utils/bold_row_text.dart';
import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  final CatBreed breed;
  final CatBreedProvider catBreedProvider;

  const BreedCard(
      {super.key, required this.breed, required this.catBreedProvider});

  void Function() gotoCatInfo(
    BuildContext context,
  ) {
    return () {
      catBreedProvider.selectCatBreed(breed).then(
          (value) => NavigationUtils.push(context, const BreedDetailScreen()));
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: gotoCatInfo(context),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                BoldRowText(
                  items: [
                    BoldTextItem(
                      text: breed.name,
                    ),
                    BoldTextItem(
                      text: 'More...',
                      onTap: gotoCatInfo(context),
                    ),
                  ],
                ),
                BreedImage(
                  url: breed.imageUrl,
                  width: 250,
                  height: 250,
                ),
                BoldRowText(
                  items: [
                    BoldTextItem(
                      text: 'Origin: ${breed.origin}',
                    ),
                    BoldTextItem(
                      text: 'Intelligence: ${breed.intelligence}/5',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
