import 'package:ani_going/controller/player_controller.dart';
import 'package:get/get.dart';

class PlayerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PlayerController());
  }
}
