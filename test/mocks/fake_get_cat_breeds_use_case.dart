import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/domain/usecases/get_cat_breeds.dart';

import 'fake_cat_breed_repository.dart';
import 'mock_cat_breed.dart';

class FakeGetCatBreedsUseCase extends GetCatBreedsUseCase {
  FakeGetCatBreedsUseCase() : super(FakeCatBreedRepository());

  @override
  Future<List<CatBreed>> call({int page = 0, int limit = 10}) async =>
      mockBreeds;

  @override
  Future<List<CatBreed>> search(String query) async => [];
}
