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
  }

  @override
  Widget build(BuildContext context) {
    // final moviesProvider = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    return Column(
      children: [const CustomAppBar(), MovieSlideShow(movies: slideShowMovies)],
    );
  }
}
