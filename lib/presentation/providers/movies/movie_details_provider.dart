import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

//GET MOVIE DETAILS
final movieDetailsProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  (ref) {
    final getMovie = ref.watch(movieRepositoryProvider).getMovieById;
    return MovieMapNotifier(getMovie: getMovie);
  },
);

// *********************************************************************
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  bool isLoading = false;
  GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (isLoading) return;
    isLoading = true;
    final Movie movie = await getMovie(movieId);
    state = {movieId: movie};
  }
}
