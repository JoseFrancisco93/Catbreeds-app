import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/domain/repositories/cat_breed_repository.dart';

class GetCatBreedsUseCase {
  final CatBreedRepository repository;

  GetCatBreedsUseCase(this.repository);

  Future<List<CatBreed>> call({int page = 0, int limit = 10}) =>
      repository.getBreeds(page: page, limit: limit);

  Future<List<CatBreed>> search(String query) => repository.searchBreeds(query);
}
