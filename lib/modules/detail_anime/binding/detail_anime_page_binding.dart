part of detail_anime;

class DetailAnimePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlayerController());
    Get.put(DetailAnimePageController());
  }
}
