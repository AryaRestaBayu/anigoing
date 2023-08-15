import 'package:hive/hive.dart';

part 'mylist_model.g.dart';

@HiveType(typeId: 3)
class MyList extends HiveObject {
  @HiveField(0)
  final String imageUrl;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String synopsis;

  @HiveField(3)
  final List genre;

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
