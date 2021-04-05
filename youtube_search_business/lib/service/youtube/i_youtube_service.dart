import 'package:youtube_search_business/models/youtube_video.dart';

abstract class IYoutubeService {
  Future<List<YoutubeVideo>> findAll();
}