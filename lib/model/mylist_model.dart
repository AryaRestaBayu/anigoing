class MyList {
  final String imageUrl;
  final String title;
  final String synopsis;
  final List genre;
  final String trailer;
  final double score;
  final int episode;
  final String type;
  final int day;
  final int month;
  final int year;

  MyList({
    required this.episode,
    required this.genre,
    required this.type,
    required this.imageUrl,
    required this.score,
    required this.synopsis,
    required this.title,
    required this.trailer,
    required this.day,
    required this.month,
    required this.year,
  });

  factory MyList.fromJson(Map<String, dynamic> json) {
    return MyList(
      episode: json['episode'],
      genre: json['genre'],
      type: json['type'],
      imageUrl: json['image_url'],
      score: json['score'].toDouble(),
      synopsis: json['synopsis'],
      title: json['title'],
      trailer: json['trailer'],
      day: json['day'],
      month: json['month'],
      year: json['year'],
    );
  }
}
