import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource datasources;

  MovieRepositoryImpl(this.datasources);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasources.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasources.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasources.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasources.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById({String movieId = 'no-id'}) {
    return datasources.getMovieById(movieId: movieId);
  }
}
