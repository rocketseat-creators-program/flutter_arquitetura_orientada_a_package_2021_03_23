import 'package:youtube_search_business/models/youtube_video.dart';

abstract class IYoutubeRepository {
  Future<List<YoutubeVideo>> findAll();
}