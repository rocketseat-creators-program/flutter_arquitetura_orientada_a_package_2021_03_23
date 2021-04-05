import 'dart:convert';


class YoutubeVideo {
  String id;
  String title;
  String thumbnail;

  YoutubeVideo({
    required this.id,
    required this.title,
    required this.thumbnail,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
    };
  }

  factory YoutubeVideo.fromMap(Map<String, dynamic> map) {
    return YoutubeVideo(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory YoutubeVideo.fromJson(String source) => YoutubeVideo.fromMap(json.decode(source));
}
