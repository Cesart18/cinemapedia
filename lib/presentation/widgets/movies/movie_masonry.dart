import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  final String titleAppBar;
  const MovieMasonry({super.key, required this.movies, this.loadNextPage, required this.titleAppBar});

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() { 

      if(widget.loadNextPage == null)return;

      if((scrollController.position.pixels + 100) >= scrollController.position.maxScrollExtent){
        widget.loadNextPage!();
      }

    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
         SliverAppBar(
          title: Text(widget.titleAppBar),
          floating: true,

        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            delegate: SliverChildBuilderDelegate(
              childCount: widget.movies.length,
              (context, index) {
                final movie = widget.movies[index];
                return MoviePosterLink(
                movie: movie
              );}
            ),
          ),
        )
      ],
    );
  }
}