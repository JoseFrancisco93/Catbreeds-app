import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/domain/repositories/cat_breed_repository.dart';

import 'mock_cat_breed.dart';

class FakeCatBreedRepository implements CatBreedRepository {
  @override
  Future<List<CatBreed>> getBreeds({int page = 0, int limit = 10}) async =>
      mockBreeds;

  @override
  Future<List<CatBreed>> searchBreeds(String query) async => [];
}
