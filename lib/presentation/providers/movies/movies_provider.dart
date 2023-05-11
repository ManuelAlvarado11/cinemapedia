import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

// GET NOWPLAYING
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

// GET POPULAR
final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

// GET UPCOMING
final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

// GET TOPRATED
final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

// *********************************************************************
// Definicion de la referencia a la funcion que va a recibir la clase que controla al proveedor del estado
typedef MovieCallback = Future<List<Movie>> Function({int page});

// Clase que controla al proveedor del estado
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    isLoading = false;
  }
}
