import 'package:catbreeds_app/core/errors/failure.dart';
import 'package:catbreeds_app/data/datasources/cat_api_service.dart';
import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/domain/repositories/cat_breed_repository.dart';

class CatBreedRepositoryImpl implements CatBreedRepository {
  final CatApiService apiService;
  CatBreedRepositoryImpl(this.apiService);

  @override
  Future<List<CatBreed>> getBreeds({int page = 0, int limit = 10}) async {
    try {
      final breeds = await apiService.fetchBreeds(page: page, limit: limit);
      return breeds.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Failure('Error loading breeds',
          exception: e is Exception ? e : null);
    }
  }

  @override
  Future<List<CatBreed>> searchBreeds(String query) async {
    try {
      final breeds = await apiService.searchBreeds(query);
      return breeds.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Failure('Error searching breeds',
          exception: e is Exception ? e : null);
    }
  }
}
