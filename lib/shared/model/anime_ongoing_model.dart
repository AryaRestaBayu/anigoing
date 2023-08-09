import 'package:hive/hive.dart';

part 'anime_ongoing_model.g.dart';

@HiveType(typeId: 1)
class AnimeOngoing extends HiveObject {
  @HiveField(0)
  final String imageUrl;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String synopsis;

  @HiveField(3)
  final List<dynamic> genre;

  @HiveField(4)
  final String trailer;

  @HiveField(5)
  final double score;

  @HiveField(6)
  final int episode;

  @HiveField(7)
  final String type;

  @HiveField(8)
  final int day;

  @HiveField(9)
  final int month;

  @HiveField(10)
  final int year;

  AnimeOngoing({
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

  factory AnimeOngoing.fromJson(Map<String, dynamic> json) {
    return AnimeOngoing(
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
