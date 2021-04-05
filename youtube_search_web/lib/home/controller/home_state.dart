import 'package:equatable/equatable.dart';

import 'package:youtube_search_business/youtube_search_business.dart';

class HomeState extends Equatable {
  
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeStateLoading extends HomeState {}

class HomeStateLoadVideos extends HomeState {
  final List<YoutubeVideo> youtubeVideos;
  
  const HomeStateLoadVideos([this.youtubeVideos = const []]);

  @override
  List<Object> get props => [youtubeVideos];

}

class HomeStateError extends HomeState {}
