import 'package:ani_going/services/api/anime_api.dart';
import 'package:get/get.dart';

class AnimeApiBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AnimeApi());
  }
}
