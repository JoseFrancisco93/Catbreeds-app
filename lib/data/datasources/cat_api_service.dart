import 'package:catbreeds_app/core/constants/api_constants.dart';
import 'package:catbreeds_app/core/network/dio_client.dart';
import 'package:catbreeds_app/data/models/cat_breed_model.dart';
import 'package:dio/dio.dart';

class CatApiService {
  final Dio _dio = DioClient.instance;

  Future<List<CatBreedModel>> fetchBreeds({
    int page = 0,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get(
        '$kCatApiUrl/breeds',
        queryParameters: {'limit': limit, 'page': page},
        options: Options(headers: {'x-api-key': kCatApiKey}),
      );
      return (response.data as List)
          .map((json) => CatBreedModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch breeds: ${e.message}');
    }
  }

  Future<List<CatBreedModel>> searchBreeds(String query) async {
    try {
      final response = await _dio.get(
        '$kCatApiUrl/breeds/search',
        queryParameters: {'q': query},
        options: Options(headers: {'x-api-key': kCatApiKey}),
      );
      return (response.data as List)
          .map((json) => CatBreedModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to search breeds: ${e.message}');
    }
  }
}
