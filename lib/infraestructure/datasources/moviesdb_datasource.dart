import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';

class MoviesdbDatasource extends MoviesDataSource {
  // Cliente HTTP DIO
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'lenguage': 'es-MX'
      },
    ),
  );
  // -------------

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  // GET NOWPLAYING
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  // GET POPULAR
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  // GET TOP RATED
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  // GET UPCOMING
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  // GET MOVIE BY ID
  @override
  Future<Movie> getMovieById({String movieId = 'no-id'}) async {
    final response = await dio.get('movie/$movieId');
    if (response.statusCode != 200) throw Exception('Movie $movieId not found');
    final movieResponse = MovieDetails.fromJson(response.data);
    final movie = MovieMapper.movieDetailsToEntity(movieResponse);
    return movie;
  }
}
