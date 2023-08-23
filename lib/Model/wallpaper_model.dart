class WallPaper {
  String largeImageURL;
  int views;
  int likes;

  WallPaper({
    required this.largeImageURL,
    required this.views,
    required this.likes,
  });

  factory WallPaper.fromJson({required Map data}) {
    return WallPaper(
      largeImageURL: data['largeImageURL'],
      views: data['views'],
      likes: data['likes'],
    );
  }
}
