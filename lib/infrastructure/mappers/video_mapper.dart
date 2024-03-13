import 'package:cinemapedia/infrastructure/models/models.dart';
import '../../domain/entities/entities.dart';

class VideoMapper {
  static moviedbVideoToEntity(Result moviebVideo) => Video(
    id: moviebVideo.id,
    name: moviebVideo.name,
    youtubeKey: moviebVideo.key,
    publishedAt: moviebVideo.publishedAt,
  );
}