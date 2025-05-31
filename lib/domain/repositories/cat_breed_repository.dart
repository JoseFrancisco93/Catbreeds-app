import 'package:catbreeds_app/domain/entities/cat_breed.dart';

abstract class CatBreedRepository {
  Future<List<CatBreed>> getBreeds({int page, int limit});
}
