part of detail_anime;

class DetailAnimePageController extends GetxController {
  final playerController = Get.find<PlayerController>();
  final detailAnimeController = Get.find<DetailAnimeController>();
  final myListController = Get.find<MyListController>();

  @override
  void onInit() {
    super.onInit();
    detailAnimeController.getArgument();
    myListController.getTitle(detailAnimeController.title!);
    playerController.getPlayer(
        detailAnimeController.isOngoing,
        detailAnimeController.isMyList,
        detailAnimeController.animeOngoing,
        detailAnimeController.animeUpcoming,
        detailAnimeController.myList);
    print('init');
  }

  @override
  void onClose() {
    Get.delete<PlayerController>(force: true);
    super.onClose();
  }
}
