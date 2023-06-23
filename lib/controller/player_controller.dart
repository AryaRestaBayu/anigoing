import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class PlayerController extends GetxController {
  PodPlayerController? playerController;

  @override
  void onInit() {
    super.onInit();
    playerController;
  }

  @override
  void onClose() {
    if (playerController != null) {
      playerController!.dispose();
      print('disposed');
    } else {
      print('not disposed');
    }
    super.onClose();
  }
}
