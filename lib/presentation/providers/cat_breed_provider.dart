import 'package:catbreeds_app/core/errors/failure.dart';
import 'package:catbreeds_app/domain/entities/cat_breed.dart';
import 'package:catbreeds_app/domain/usecases/get_cat_breeds.dart';
import 'package:flutter/material.dart';

class CatBreedProvider with ChangeNotifier {
  final GetCatBreedsUseCase getCatBreedsUseCase;

  List<CatBreed> breeds = [];
  bool loading = false;
  String? errorMessage;
  CatBreed? catBreedSelected;
  int _page = 0;
  final int _limit = 10;
  bool hasMore = true;

  String _search = '';
  bool searchingRemotely = false;
  String get searchValue => _search;

  CatBreedProvider(this.getCatBreedsUseCase);

  set search(String value) {
    _search = value.trim();
    _page = 0;
    hasMore = true;
    notifyListeners();
    searchBreeds();
  }

  Future<void> searchBreeds() async {
    if (_search.isEmpty) {
      breeds.clear();
      await loadBreeds();
      return;
    }

    final localResults = breeds
        .where((b) => b.name.toLowerCase().contains(_search.toLowerCase()))
        .toList();

    if (localResults.isNotEmpty) {
      breeds = localResults;
      hasMore = false;
      notifyListeners();
    } else {
      loading = true;
      searchingRemotely = true;
      errorMessage = null;
      notifyListeners();

      try {
        final remoteResults = await getCatBreedsUseCase.search(_search);
        breeds = remoteResults;
        hasMore = false;
      } catch (e) {
        errorMessage =
            e is Failure ? e.message : 'An unexpected error occurred.';
      }
      loading = false;
      searchingRemotely = false;
      notifyListeners();
    }
  }

  Future<void> loadBreeds({bool loadMore = false}) async {
    if (loading || !hasMore) return;
    loading = true;
    errorMessage = null;
    notifyListeners();
    try {
      List<CatBreed> newBreeds;
      if (_search.isEmpty) {
        newBreeds = await getCatBreedsUseCase(page: _page, limit: _limit);
      } else {
        if (_page > 0) {
          loading = false;
          notifyListeners();
          return;
        }
        newBreeds = await getCatBreedsUseCase.search(_search);
      }
      if (loadMore) {
        breeds.addAll(newBreeds);
      } else {
        breeds = newBreeds;
      }
      hasMore = newBreeds.length == _limit && _search.isEmpty;
      if (hasMore && loadMore) _page++;
    } catch (e) {
      errorMessage = e is Failure ? e.message : 'An unexpected error occurred.';
    }
    loading = false;
    notifyListeners();
  }

  void loadNextPage() {
    if (hasMore && !loading && _search.isEmpty) {
      _page++;
      loadBreeds(loadMore: true);
    }
  }

  Future<void> selectCatBreed(CatBreed catBreed) async {
    catBreedSelected = catBreed;
    notifyListeners();
  }

  List<CatBreed> get filteredBreeds => breeds;
}
