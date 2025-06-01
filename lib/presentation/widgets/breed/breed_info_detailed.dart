import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/presentation/models/bold_text_item.dart';
import 'package:catbreeds_app/presentation/widgets/utils/bold_column_text.dart';
import 'package:flutter/material.dart';

class BreedInfoDetailed extends StatelessWidget {
  final CatBreed breed;
  const BreedInfoDetailed({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    final infoFields = [
      {'label': 'Origin', 'value': breed.origin},
      {'label': 'Intelligence', 'value': breed.intelligence?.toString() ?? '-'},
      {'label': 'Adaptability', 'value': breed.adaptability?.toString() ?? '-'},
      {
        'label': 'Affection Level',
        'value': breed.affectionLevel?.toString() ?? '-'
      },
      {
        'label': 'Child Friendly',
        'value': breed.childFriendly?.toString() ?? '-'
      },
      {'label': 'Dog Friendly', 'value': breed.dogFriendly?.toString() ?? '-'},
      {'label': 'Energy Level', 'value': breed.energyLevel?.toString() ?? '-'},
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            breed.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          BoldColumnText(
            items: infoFields
                .map((f) => BoldTextItem(text: "${f['label']}: ${f['value']}"))
                .toList(),
          ),
        ],
      ),
    );
  }
}
