import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:cinemapedia/presentation/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(),

      // body

      body: const _HomeVeiw(),

      // drawer

      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class _HomeVeiw extends ConsumerStatefulWidget {
  const _HomeVeiw();

  @override
  _HomeVeiwState createState() => _HomeVeiwState();
}

class _HomeVeiwState extends ConsumerState<_HomeVeiw> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = ref.watch(nowPlayingMoviesProvider);
    return ListView.builder(
        itemCount: moviesProvider.length,
        itemBuilder: (context, index) {
          final movies = moviesProvider[index];
          return ListTile(
            title: Text(movies.title),
            subtitle: Text(movies.originalTitle),
          );
        });
  }
}
