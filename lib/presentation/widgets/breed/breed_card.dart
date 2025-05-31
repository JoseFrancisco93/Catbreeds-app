import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/presentation/models/bold_text_item.dart';
import 'package:catbreeds_app/presentation/providers/cat_breed_provider.dart';
import 'package:catbreeds_app/presentation/widgets/breed/breed_image.dart';
import 'package:catbreeds_app/presentation/widgets/utils/bold_row_text.dart';
import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  final CatBreed breed;
  final CatBreedProvider catBreedProvider;

  const BreedCard(
      {super.key, required this.breed, required this.catBreedProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
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
                      onTap: () {},
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
