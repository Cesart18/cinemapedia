import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> {
  bool isLoading = false;
  bool isLastPage = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  


  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(popularMoviesProvider);
    return Scaffold(
        body: MovieMasonry(
          titleAppBar: 'Populares',
          movies: movies,
        loadNextPage:() => ref.read(popularMoviesProvider.notifier).loadNextPage(),)
        );
  }
}
