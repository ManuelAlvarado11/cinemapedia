import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    // PROVIDERS (OBTENER VALOR)
    ref.read(movieDetailsProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    // SUBSCRIBIRSE A CAMBIOS DE PROVIDERS (VALOR)
    final movie = ref.watch(movieDetailsProvider)[widget.movieId];

    if (movie == null) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Movie ID: ${widget.movieId}')),
      body: SizedBox(
        child: Text(movie.title),
      ),
    );
  }
}
