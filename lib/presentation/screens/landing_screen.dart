import 'package:catbreeds_app/presentation/providers/cat_breed_provider.dart';
import 'package:catbreeds_app/presentation/widgets/breed/breed_card.dart';
import 'package:catbreeds_app/presentation/widgets/breed/search_breed.dart';
import 'package:catbreeds_app/presentation/widgets/errors/fetch_error.dart';
import 'package:catbreeds_app/presentation/widgets/utils/no_results_found.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catBreedProvider = Provider.of<CatBreedProvider>(context);
    final hasResults = catBreedProvider.filteredBreeds.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBar(
            hintText: 'Find a breed',
            onChanged: (value) => catBreedProvider.search = value,
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (!catBreedProvider.loading &&
                    catBreedProvider.hasMore &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    catBreedProvider.searchValue.isEmpty) {
                  catBreedProvider.loadNextPage();
                }
                return false;
              },
              child: catBreedProvider.loading && catBreedProvider.breeds.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : catBreedProvider.errorMessage != null
                      ? FetchError(
                          message: catBreedProvider.errorMessage!,
                          onRetry: () => catBreedProvider.loadBreeds(),
                        )
                      : hasResults
                          ? ListView.builder(
                              itemCount:
                                  catBreedProvider.filteredBreeds.length +
                                      (catBreedProvider.hasMore ? 1 : 0),
                              itemBuilder: (_, i) {
                                if (i <
                                    catBreedProvider.filteredBreeds.length) {
                                  final breed =
                                      catBreedProvider.filteredBreeds[i];
                                  return BreedCard(
                                    key: ValueKey(breed.id),
                                    breed: breed,
                                    catBreedProvider: catBreedProvider,
                                  );
                                } else {
                                  return const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                              },
                            )
                          : const NoResultsFound(),
            ),
          )
        ],
      ),
    );
  }
}
