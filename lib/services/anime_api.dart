import 'dart:convert';

import 'package:ani_going/constant/AppColor.dart';
import 'package:ani_going/shared/model/anime_ongoing_model.dart';
import 'package:ani_going/shared/model/anime_upcoming_model.dart';
import 'package:ani_going/utils/custom_snackbar.dart';
import 'package:http/http.dart' as http;

class AnimeApi {
  Future getAnimeOngoing() async {
    var response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/seasons/now'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List list =
          (data['data'] as List).map((e) => AnimeOngoing.fromJson(e)).toList();
      print(response.statusCode);
      return list;
    } else {
      print(response.statusCode);
      CustomSnackbar.snackBar('Tidak ada internet', AppColor.error);
    }
  }

  Future getAnimeUpcoming() async {
    var response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/seasons/upcoming'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List list =
          (data['data'] as List).map((e) => AnimeUpcoming.fromJson(e)).toList();
      print(response.statusCode);
      return list;
    } else {
      print(response.statusCode);
    }
  }
}
