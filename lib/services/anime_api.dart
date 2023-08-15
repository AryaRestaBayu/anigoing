import 'dart:convert';

import 'package:ani_going/constant/AppColor.dart';
import 'package:ani_going/constant/HiveBox.dart';
import 'package:ani_going/services/prefs.dart';
import 'package:ani_going/shared/model/anime_ongoing_model.dart';
import 'package:ani_going/shared/model/anime_upcoming_model.dart';
import 'package:ani_going/utils/custom_snackbar.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class AnimeApi {
  late List<AnimeOngoing> animeOngoing;
  late List<AnimeUpcoming> animeUpcoming;

  Future getAnimeOngoing() async {
    DateTime currentTime = DateTime.now();
    DateTime? lastApiCallTime = await SharePref().getLastApiCallTimeOngoing();
    print(lastApiCallTime);

    if (lastApiCallTime == null ||
        currentTime.difference(lastApiCallTime).inHours >= 1) {
      lastApiCallTime = currentTime;
      SharePref().saveLastApiCallTimeOngoing(lastApiCallTime);

      var response =
          await http.get(Uri.parse('https://api.jikan.moe/v4/seasons/now'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        animeOngoing = (data['data'] as List)
            .map((e) => AnimeOngoing.fromJson(e))
            .toList();
        final animeBox = await Hive.openBox<AnimeOngoing>(HiveBox.animeOngoing);
        animeBox.clear();
        animeBox.addAll(animeOngoing);
        animeBox.close();

        print(response.statusCode);
        return animeOngoing;
      } else {
        print(response.statusCode);
        CustomSnackbar.snackBar('Tidak ada internet', AppColor.error);
      }
    } else {
      print('dari box ongoing');
      final animeBox = await Hive.openBox<AnimeOngoing>(HiveBox.animeOngoing);
      animeOngoing = animeBox.values.toList();
      animeBox.close();
      print(animeOngoing.length);
      return animeOngoing;
    }
  }

  Future getAnimeUpcoming() async {
    DateTime currentTime = DateTime.now();
    DateTime? lastApiCallTime = await SharePref().getLastApiCallTimeUpcoming();
    print(lastApiCallTime);

    if (lastApiCallTime == null ||
        currentTime.difference(lastApiCallTime).inHours >= 1) {
      lastApiCallTime = currentTime;
      SharePref().saveLastApiCallTimeUpcoming(lastApiCallTime);

      var response = await http
          .get(Uri.parse('https://api.jikan.moe/v4/seasons/upcoming'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        animeUpcoming = (data['data'] as List)
            .map((e) => AnimeUpcoming.fromJson(e))
            .toList();
        final animeBox =
            await Hive.openBox<AnimeUpcoming>(HiveBox.animeUpcoming);
        animeBox.clear();
        animeBox.addAll(animeUpcoming);
        animeBox.close();

        print(response.statusCode);
        return animeUpcoming;
      } else {
        print(response.statusCode);
        CustomSnackbar.snackBar('Tidak ada internet', AppColor.error);
      }
    } else {
      print('dari box upcoming');
      final animeBox = await Hive.openBox<AnimeUpcoming>(HiveBox.animeUpcoming);
      animeUpcoming = animeBox.values.toList();
      animeBox.close();
      print(animeUpcoming.length);
      return animeUpcoming;
    }
  }
}
