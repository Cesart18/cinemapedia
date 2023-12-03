import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_videos.dart';

class VideoMapper {
  static Video movieDbVideoToEntity(Result video) => Video(
      id: video.id,
      name: video.name,
      youtubeKey: video.key,
      publishedAt: video.publishedAt);
}
