import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:ani_going/model/mylist_model.dart';
import 'package:ani_going/routes.dart';
import 'package:get/get.dart';

class DetailAnimeController extends GetxController {
  AnimeOngoing? animeOngoing;
  AnimeUpcoming? animeUpcoming;
  MyList? myList;
  late bool isOngoing;
  late bool isMyList;

  void getArgument() {
    try {
      final arguments = Get.arguments;
      animeOngoing = arguments?['animeOngoing'];
      animeUpcoming = arguments?['animeUpcoming'];
      myList = arguments?['myList'];
      isOngoing = arguments?['isOngoing'];
      isMyList = arguments?['isMyList'];
      print(animeOngoing);
      print(animeUpcoming);
      print(isOngoing);
      print(isMyList);
    } catch (e) {
      print(e.toString());
    }
  }

  void sendArgument({
    bool? isOngoing,
    bool? isMyList,
    AnimeOngoing? animeOngoing,
    AnimeUpcoming? animeUpcoming,
    MyList? myList,
  }) {
    Get.toNamed(AppRoutes.detailAnimePage, arguments: {
      'animeOngoing': animeOngoing,
      'animeUpcoming': animeUpcoming,
      'myList': myList,
      'isOngoing': isOngoing,
      'isMyList': isMyList,
    });
  }
}
