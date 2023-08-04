class AnimeUpcoming {
  String imageUrl;
  String title;
  String synopsis;
  List genre;
  String trailer;
  dynamic score;
  int episode;
  String type;
  int day;
  int month;
  int year;

  AnimeUpcoming({
    required this.imageUrl,
    required this.title,
    required this.synopsis,
    required this.genre,
    required this.trailer,
    required this.score,
    required this.episode,
    required this.type,
    required this.day,
    required this.month,
    required this.year,
  });

  factory AnimeUpcoming.fromJson(Map<String, dynamic> json) {
    return AnimeUpcoming(
      imageUrl: json['images']['jpg']['image_url'] ?? '-',
      title: json['title'] ?? '-',
      synopsis: json['synopsis'] ?? '-',
      genre: json['genres'] ?? '-',
      trailer: json['trailer']['url'] ?? '-',
      score: json['score'] ?? 0,
      episode: json['episodes'] ?? 0,
      type: json['type'] ?? '-',
      day: json['aired']['prop']['from']['day'] ?? 0,
      month: json['aired']['prop']['from']['month'] ?? 0,
      year: json['aired']['prop']['from']['year'] ?? 0,
    );
  }
}
