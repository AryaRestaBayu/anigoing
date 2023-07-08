import 'package:ani_going/controller/detail_anime_controller.dart';
import 'package:get/get.dart';

class DetailAnimeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailAnimeController());
  }
}
