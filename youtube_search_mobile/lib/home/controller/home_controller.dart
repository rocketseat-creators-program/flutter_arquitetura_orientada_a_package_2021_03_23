import 'package:bloc/bloc.dart';
import 'package:youtube_search_business/youtube_search_business.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  
  IYoutubeService _service;

  HomeController(this._service) : super(HomeStateLoading());

  Future<void> loadYoutuVideos() async {
    final videos = await _service.findAll();
    emit(HomeStateLoadVideos(videos));
  }

}