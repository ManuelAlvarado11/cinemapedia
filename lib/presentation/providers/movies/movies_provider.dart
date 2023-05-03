import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

// Definicion del proveedor del estado
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    // Referencia a la funcion(Evento que dispara cambios en el STATE)
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

    // Instanciamos controlador de proveedor de estado
    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

// Clase que controla al proveedor del estado
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}

// Definicion de la referencia a la funcion que va a recibir la clase que controla al proveedor del estado
typedef MovieCallback = Future<List<Movie>> Function({int page});
