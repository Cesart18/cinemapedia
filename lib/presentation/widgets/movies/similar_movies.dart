import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final similarMoviesProvider = FutureProvider.family((ref,int movieID){

  final movieRepository = ref.watch(moviesRepositoryProvider);
  return movieRepository.getSimilaR(movieID);

});

class SimilarMovies extends ConsumerWidget {
  final int movieId;
  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context,ref) {
    final similarMovieFuture = ref.watch(similarMoviesProvider(movieId));
    
    return similarMovieFuture.when(
      data: (movies) => _Recomendations(movies: movies),
       error: (error, stackTrace) => const Center(child: Text('No se pudo cargar las peliculas similares'),),
        loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2,),),);
  }
}

class _Recomendations extends StatelessWidget {
  final List<Movie> movies;
  const _Recomendations({required this.movies});

  @override
  Widget build(BuildContext context) {

    if(movies.isEmpty) return const SizedBox();

    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      child: MoviesHoritzontalListveiw(
        movies: movies,
        title: 'Recomendaciones',
      ),
    );
  }
}