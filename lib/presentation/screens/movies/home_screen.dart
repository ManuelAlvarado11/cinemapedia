import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // PROVIDERS (OBTENER VALOR)
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // SUBSCRIBIRSE A CAMBIOS DE PROVIDERS (VALOR)
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);

    return CustomScrollView(
      slivers: [
        // AppBar
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),

        // Listas de peliculas
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              // SlideShow
              MoviesSlideshow(movies: moviesSlideshow),

              // En cines
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              const SizedBox(height: 10),

              // Populares
              MovieHorizontalListview(
                movies: popularMovies,
                title: 'Populares',
                subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              const SizedBox(height: 10),
            ],
          );
        }, childCount: 1)),
      ],
    );
  }
}
