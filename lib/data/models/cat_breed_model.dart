import 'package:catbreeds_app/domain/entities/cat_breed.dart';

class CatBreedModel {
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String? imageUrl;
  final int? lifeSpanMin;
  final int? lifeSpanMax;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final String? wikipediaUrl;
  final String? altNames;
  final Map<String, dynamic>? image;

  CatBreedModel({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    this.imageUrl,
    this.lifeSpanMin,
    this.lifeSpanMax,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.wikipediaUrl,
    this.altNames,
    this.image,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    int? minLifeSpan;
    int? maxLifeSpan;
    if (json['life_span'] != null &&
        (json['life_span'] as String).contains(' - ')) {
      final parts = (json['life_span'] as String).split(' - ');
      minLifeSpan = int.tryParse(parts[0]);
      maxLifeSpan = int.tryParse(parts[1]);
    } else if (json['life_span'] != null) {
      minLifeSpan = int.tryParse(json['life_span']);
      maxLifeSpan = int.tryParse(json['life_span']);
    }

    return CatBreedModel(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      countryCodes: json['country_codes'] ?? '',
      countryCode: json['country_code'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image']?['url'],
      lifeSpanMin: minLifeSpan,
      lifeSpanMax: maxLifeSpan,
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      wikipediaUrl: json['wikipedia_url'],
      altNames: json['alt_names'],
      image: json['image'],
    );
  }

  CatBreed toEntity() {
    return CatBreed(
      id: id,
      name: name,
      origin: origin,
      description: description,
      imageUrl: imageUrl,
      intelligence: intelligence,
      adaptability: adaptability,
      affectionLevel: affectionLevel,
      childFriendly: childFriendly,
      dogFriendly: dogFriendly,
      energyLevel: energyLevel,
    );
  }
}
