import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(),
      // body
      body: _HomeVeiw(),
      // drawer
      // drawer:  SideMenu(),
      // bottom navigationbar
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeVeiw extends ConsumerStatefulWidget {
  const _HomeVeiw();

  @override
  _HomeVeiwState createState() => _HomeVeiwState();
}

class _HomeVeiwState extends ConsumerState<_HomeVeiw> {
  bool hasLoadedMovies = false;
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initiaLoading = ref.watch(initialLoadingProvider);

    if (initiaLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          leading: SizedBox(),
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(horizontal: 0),
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 1, (context, index) {
          return Column(
            children: [
              MovieSlideShow(movies: slideShowMovies),
              MoviesHoritzontalListveiw(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MoviesHoritzontalListveiw(
                movies: upComingMovies,
                title: 'Proximamente',
                subTitle: 'En este mes',
                loadNextPage: () =>
                    ref.read(upComingMoviesProvider.notifier).loadNextPage(),
              ),
              MoviesHoritzontalListveiw(
                movies: popularMovies,
                title: 'Populares',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              MoviesHoritzontalListveiw(
                movies: topRatedMovies,
                title: 'Mejor calificadas',
                subTitle: 'Desde siempre',
                loadNextPage: () =>
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
              ),
            ],
          );
        }))
      ],
    );
  }
}
