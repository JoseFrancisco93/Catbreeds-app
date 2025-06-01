class CatBreed {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String? imageUrl;
  final int? intelligence;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;

  CatBreed({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    this.imageUrl,
    this.intelligence,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
  });
}
