import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class PlayerController extends GetxController {
  PodPlayerController? playerController;

  @override
  void onInit() {
    super.onInit();
    playerController;
    print('init');
  }

  getPlayer(bool isOngoing, AnimeOngoing? animeOngoing,
      AnimeUpcoming? animeUpcoming) {
    if (isOngoing) {
      if (animeOngoing?.trailer != '-') {
        playerController = PodPlayerController(
          podPlayerConfig: const PodPlayerConfig(
            videoQualityPriority: [360, 480],
            autoPlay: false,
            isLooping: false,
          ),
          playVideoFrom: PlayVideoFrom.youtube(animeOngoing!.trailer),
        )..initialise();
        print(animeOngoing.trailer);
      }
    } else {
      if (animeUpcoming?.trailer != '-') {
        playerController = PodPlayerController(
          podPlayerConfig: const PodPlayerConfig(
            videoQualityPriority: [360, 480],
            autoPlay: false,
            isLooping: false,
          ),
          playVideoFrom: PlayVideoFrom.youtube(animeUpcoming!.trailer),
        )..initialise();
        print(animeUpcoming.trailer);
      }
    }
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
