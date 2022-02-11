class Photo {
  final int albumId;
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;
  bool liked = false;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJSON(dynamic json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'].toString(),
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  void triggerLike() {
    liked = !liked;
  }
}
