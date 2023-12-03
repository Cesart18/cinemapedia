import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/movie_datasource.dart';
import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/domain/entities/movie/video.dart';
import 'package:cinemapedia/infrastructure/mapper/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/mapper/video_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_videos.dart';
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
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _toJson(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _toJson(response.data);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _toJson(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response =
        await dio.get('/search/movie', queryParameters: {'query': query});
    return _toJson(response.data);
  }
  
  @override
  Future<List<Movie>> getSimilaR(int movieId) async{

    final response = await dio.get('/movie/$movieId/recommendations');
    return _toJson(response.data);

  }

  /*  
  
  lo que realment considero que realizo fue una entidad nueva de como queria que se vieran las peliculas
  ademas de ello hizo un mapper donde traduce en teoria la respuesta del api a como quiero que se vea mi app
  ademas de ello hizo un ciclo for in para barrer cada video en una lista nueva de videos
  

   */

  @override
  Future<List<Video>> getYoutubeVideo(int movieId) async{
    final response = await dio.get('/movie/$movieId/videos');
    final moviedbVideosResponse = MovieDbVideosResponse.fromJson(response.data);

    final videos = <Video>[];

    for (final moviedbVideo in moviedbVideosResponse.results){
      if(moviedbVideo.site == 'YouTube'){
        final video = VideoMapper.movieDbVideoToEntity(moviedbVideo);
        videos.add(video);
      }
    }

    return videos;

  }
  
}