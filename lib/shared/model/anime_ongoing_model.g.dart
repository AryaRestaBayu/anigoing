// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_ongoing_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeOngoingAdapter extends TypeAdapter<AnimeOngoing> {
  @override
  final int typeId = 1;

  @override
  AnimeOngoing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeOngoing(
      imageUrl: fields[0] as String,
      title: fields[1] as String,
      synopsis: fields[2] as String,
      genre: (fields[3] as List).cast<dynamic>(),
      trailer: fields[4] as String,
      score: fields[5] as double,
      episode: fields[6] as int,
      type: fields[7] as String,
      day: fields[8] as int,
      month: fields[9] as int,
      year: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeOngoing obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.synopsis)
      ..writeByte(3)
      ..write(obj.genre)
      ..writeByte(4)
      ..write(obj.trailer)
      ..writeByte(5)
      ..write(obj.score)
      ..writeByte(6)
      ..write(obj.episode)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.day)
      ..writeByte(9)
      ..write(obj.month)
      ..writeByte(10)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeOngoingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
