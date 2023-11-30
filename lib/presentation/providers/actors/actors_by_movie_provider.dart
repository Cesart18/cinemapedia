import 'package:cinemapedia/domain/entities/movie/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorByMovieProvider =
    StateNotifierProvider<ActorNotifier, Map<String, List<Actor>>>((ref) {
  final actorProvider = ref.watch(actorsRepositoryProvider).getActorByMovie;

  return ActorNotifier(getActor: actorProvider);
});

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActor;
  ActorNotifier({required this.getActor}) : super({});

  Future<void> loadActor(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActor(movieId);
    state = {...state, movieId: actors};
  }
}
