import 'package:dio/dio.dart';
import 'package:youtube_search_business/models/youtube_video.dart';
import 'package:youtube_search_business/repository/youtube/i_youtube_repository.dart';

class YoutubeRepository implements IYoutubeRepository {
  @override
  Future<List<YoutubeVideo>> findAll() async {
    try {
      final dio = Dio();
      String googleKey = const String.fromEnvironment('GOOGLE_KEY', defaultValue: "123");
      final response = await dio.get<Map>(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&key=$googleKey&channelId=UC5hvPObwya8kzWWB-wmVlXg&order=date&maxResults=50',
      );

      final items = response.data?['items'] ?? [];
      return items
          .map<YoutubeVideo>(
            (item) => YoutubeVideo(
              id: item['id']['videoId'] ?? '',
              title: item['snippet']['title'],
              thumbnail: item['snippet']['thumbnails']['medium']['url'],
            ),
          )
          .toList();
    } on DioError catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }
}
