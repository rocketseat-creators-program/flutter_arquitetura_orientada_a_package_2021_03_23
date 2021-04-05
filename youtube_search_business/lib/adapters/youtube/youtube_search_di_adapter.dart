
import 'package:flutter_modular/flutter_modular.dart';
import 'package:youtube_search_business/core/modular_adapter.dart';
import 'package:youtube_search_business/repository/youtube/i_youtube_repository.dart';
import 'package:youtube_search_business/repository/youtube/youtube_repository.dart';
import 'package:youtube_search_business/service/youtube/i_youtube_service.dart';
import 'package:youtube_search_business/service/youtube/youtube_service.dart';

class YoutubeSearchDIAdapter {
  
  @override
  List<Bind<Object>> modular() => [
      Bind.lazySingleton<IYoutubeRepository>((i) => YoutubeRepository()),
      Bind.lazySingleton<IYoutubeService>((i) => YoutubeService(i())),
    ];
}
