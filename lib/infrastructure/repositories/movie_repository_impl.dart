import 'package:cinemapedia/domain/datasource/movie_datasource.dart';
import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource movieDatasource;

  MovieRepositoryImpl({required this.movieDatasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return movieDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return movieDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return movieDatasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return movieDatasource.getUpComing(page: page);
  }
}
