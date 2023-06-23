class AnimeOngoing {
  String imageUrl;
  String title;
  String synopsis;
  List genre;
  String trailer;
  dynamic score;
  int episode;
  int year;

  String type;

  AnimeOngoing({
    required this.imageUrl,
    required this.title,
    required this.synopsis,
    required this.genre,
    required this.trailer,
    required this.score,
    required this.episode,
    required this.year,
    required this.type,
  });

  factory AnimeOngoing.fromJson(Map<String, dynamic> json) {
    return AnimeOngoing(
      imageUrl: json['images']['jpg']['image_url'] ?? '-',
      title: json['title'] ?? '-',
      synopsis: json['synopsis'] ?? '-',
      genre: json['genres'] ?? '-',
      trailer: json['trailer']['url'] ?? '-',
      score: json['score'] ?? 0,
      episode: json['episodes'] ?? 0,
      year: json['year'] ?? 0,
      type: json['type'] ?? '-',
    );
  }
}
