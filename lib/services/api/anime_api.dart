import 'dart:convert';

import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AnimeApi extends GetxController {
  RxList<AnimeOngoing> animeOngoingList = <AnimeOngoing>[].obs;
  RxList<AnimeUpcoming> animeUpcomingList = <AnimeUpcoming>[].obs;

  @override
  void onInit() {
    getAnimeOngoing();
    getAnimeUpcoming();
    super.onInit();
  }

  Future getAnimeOngoing() async {
    var response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/seasons/now'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      animeOngoingList.value =
          (data['data'] as List).map((e) => AnimeOngoing.fromJson(e)).toList();
      print(response.statusCode);
      update();
    } else {
      print(response.statusCode);
    }
  }

  Future getAnimeUpcoming() async {
    var response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/seasons/upcoming'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      animeUpcomingList.value =
          (data['data'] as List).map((e) => AnimeUpcoming.fromJson(e)).toList();
      print(response.statusCode);
      update();
    } else {
      print(response.statusCode);
    }
  }
}
