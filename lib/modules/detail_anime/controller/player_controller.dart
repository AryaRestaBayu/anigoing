part of detail_anime;

class PlayerController extends GetxController {
  PodPlayerController? podPlayerController;

  @override
  void onInit() {
    super.onInit();
    podPlayerController;
    print('init');
  }

  PodPlayerController? getPlayer(
      RxBool isOngoing,
      RxBool isMyList,
      AnimeOngoing? animeOngoing,
      AnimeUpcoming? animeUpcoming,
      MyList? myList) {
    if (isOngoing.value) {
      if (animeOngoing?.trailer != '-') {
        podPlayerController = PodPlayerController(
          podPlayerConfig: const PodPlayerConfig(
            videoQualityPriority: [360, 480],
            autoPlay: false,
            isLooping: false,
          ),
          playVideoFrom: PlayVideoFrom.youtube(animeOngoing!.trailer),
        )..initialise();
        print(animeOngoing.trailer);
      }
    } else if (isMyList.value) {
      if (myList?.trailer != '-') {
        podPlayerController = PodPlayerController(
          podPlayerConfig: const PodPlayerConfig(
            videoQualityPriority: [360, 480],
            autoPlay: false,
            isLooping: false,
          ),
          playVideoFrom: PlayVideoFrom.youtube(myList!.trailer),
        )..initialise();
        print(myList.trailer);
      }
    } else {
      if (animeUpcoming?.trailer != '-') {
        podPlayerController = PodPlayerController(
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
    return podPlayerController;
  }

  @override
  void onClose() {
    if (podPlayerController != null) {
      podPlayerController!.dispose();
      podPlayerController = null;
      print('disposed');
    } else {
      print('not disposed');
    }
    super.onClose();
  }
}
