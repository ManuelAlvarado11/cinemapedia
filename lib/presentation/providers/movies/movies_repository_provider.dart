import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infraestructure/datasources/moviesdb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviesdbDatasource());
});
