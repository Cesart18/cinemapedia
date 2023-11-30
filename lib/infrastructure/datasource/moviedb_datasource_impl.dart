import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/movie_datasource.dart';
import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/infrastructure/mapper/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDataSourceImpl extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Movie> _toJson(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movie) => MovieMapper.movieDbToEntity(movie))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _toJson(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async{
    final response = await dio.get('/movie/popular', queryParameters: {'page': page});
    return _toJson(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
   final response = await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _toJson(response.data);
  }
  
  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
   final response = await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _toJson(response.data);
  }
}
