import 'package:cinemapedia/infrastructure/datasource/moviedb_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(movieDatasource: MovieDbDataSourceImpl());
});
