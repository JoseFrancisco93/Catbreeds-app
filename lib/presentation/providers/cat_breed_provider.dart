import 'package:catbreeds_app/core/errors/failure.dart';
import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/domain/usecases/get_cat_breeds.dart';
import 'package:flutter/material.dart';

class CatBreedProvider with ChangeNotifier {
  final GetCatBreedsUseCase getCatBreedsUseCase;

  List<CatBreed> breeds = [];
  bool loading = false;
  String? errorMessage;
  int _page = 0;
  final int _limit = 10;
  bool hasMore = true;

  CatBreedProvider(this.getCatBreedsUseCase);

  Future<void> loadBreeds({bool loadMore = false}) async {
    if (loading || !hasMore) return;
    loading = true;
    errorMessage = null;
    notifyListeners();
    try {
      List<CatBreed> newBreeds;
      if (_page > 0) {
        loading = false;
        notifyListeners();
        return;
      }
      newBreeds = await getCatBreedsUseCase.call(page: _page, limit: _limit);
      if (loadMore) {
        breeds.addAll(newBreeds);
      } else {
        breeds = newBreeds;
      }
      hasMore = newBreeds.length == _limit;
      if (hasMore && loadMore) _page++;
    } catch (e) {
      errorMessage = e is Failure ? e.message : 'An unexpected error occurred.';
    }
    loading = false;
    notifyListeners();
  }
}
