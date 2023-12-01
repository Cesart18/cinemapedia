import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_rounded,
                color: colors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Cinemapedia',
                style: textStyle.titleMedium,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final searchQuery = ref.read(searchQueryProvider);
                    final searchedMovie = ref.read(searchedMoviesProvider);

                    showSearch<Movie?>(
                            query: searchQuery,
                            context: context,
                            delegate: SearchMovieDelegate(
                                initialMovies: searchedMovie,
                                searchMovies: ref
                                    .read(searchedMoviesProvider.notifier)
                                    .searchMoviesByQuery))
                        .then((movie) {
                      if (movie == null) return;
                      context.push('/movie/${movie.id}');
                    });
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
