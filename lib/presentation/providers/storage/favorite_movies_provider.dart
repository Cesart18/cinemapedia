import 'package:cinemapedia/domain/entities/movie/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier,Map<int, Movie>>((ref) {

  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);

});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;
  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10,limit: 20);
    page++;

    final tempMovies = <int, Movie>{};

    for (final movie in movies) {
      tempMovies[movie.id] = movie;
    }

    state = {...state, ...tempMovies};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie)async{
    await localStorageRepository.toggleFavorite(movie);
    final bool isInFavorite = state[movie.id] != null;

    if(isInFavorite){
      state.remove(movie.id);
      state = {...state};
    }else{

      state = {...state, movie.id: movie};

    }




  }

}