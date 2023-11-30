import 'package:cinemapedia/domain/datasource/actor_datasource.dart';
import 'package:cinemapedia/domain/entities/movie/actor.dart';
import 'package:cinemapedia/domain/repositories/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDatasource actorDatasource;

  ActorRepositoryImpl({required this.actorDatasource});

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return actorDatasource.getActorByMovie(movieId);
  }
}
