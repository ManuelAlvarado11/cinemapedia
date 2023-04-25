import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';

class MoviesdbDatasource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'lenguage': 'es-MX'
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/now_playing');

    final List<Movie> movies = [];
    return movies;
  }
}
