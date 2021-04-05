import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_search_business/models/youtube_video.dart';
import 'package:youtube_search_business/repository/youtube/i_youtube_repository.dart';

import './i_youtube_service.dart';

class YoutubeService implements IYoutubeService {
  IYoutubeRepository _repository;

  YoutubeService(
    this._repository,
  );

  @override
  Future<List<YoutubeVideo>> findAll() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey('videos')) {
      final videos = sp.getStringList('videos')!;
      return videos.map((v) => YoutubeVideo.fromJson(v)).toList();
    }
    final videos = await _repository.findAll();
    sp.setStringList(
      'videos',
      videos.map((e) => e.toJson()).toList(),
    );

    return videos;
  }
}
