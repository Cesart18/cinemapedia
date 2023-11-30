import 'package:cinemapedia/domain/entities/movie/actor.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorByMovie(String movieId);
}
