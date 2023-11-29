import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingProvider = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingProvider.isEmpty) return ([]);
  return nowPlayingProvider.sublist(0, 7);
});
