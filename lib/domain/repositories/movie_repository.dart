import 'package:cinemapedia/domain/entities/movie/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
