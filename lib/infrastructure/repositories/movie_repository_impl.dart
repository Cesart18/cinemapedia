import 'package:cinemapedia/domain/datasource/movie_datasource.dart';
import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/domain/entities/movie/video.dart';
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

  @override
  Future<Movie> getMovieById(String id) {
    return movieDatasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return movieDatasource.searchMovies(query);
  }
  
  @override
  Future<List<Movie>> getSimilaR(int id) {
    return movieDatasource.getSimilaR(id);
  }

  @override
  Future<List<Video>> getYoutubeVideo(int movieId) {
    return movieDatasource.getYoutubeVideo(movieId);
  }
  
 
}
