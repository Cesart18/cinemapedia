import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: movieDb.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
          : 'https://lasaclipa.org/assets/uploads/no-image-available.png',
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: movieDb.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
          : 'no-poster',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);

  static Movie movieDetailsToEntity(MovieDetails movieD) => Movie(
      adult: movieD.adult,
      backdropPath: movieD.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieD.backdropPath}'
          : 'https://lasaclipa.org/assets/uploads/no-image-available.png',
      genreIds: movieD.genres.map((e) => e.name).toList(),
      id: movieD.id,
      originalLanguage: movieD.originalLanguage,
      originalTitle: movieD.originalTitle,
      overview: movieD.overview,
      popularity: movieD.popularity,
      posterPath: movieD.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieD.backdropPath}'
          : 'https://lasaclipa.org/assets/uploads/no-image-available.png',
      releaseDate: movieD.releaseDate,
      title: movieD.title,
      video: movieD.video,
      voteAverage: movieD.voteAverage,
      voteCount: movieD.voteCount);
}
