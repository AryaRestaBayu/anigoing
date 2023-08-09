part of home;

class HomePageController extends GetxController {
  final detailAnimeController = Get.find<DetailAnimeController>();
  final animeApi = AnimeApi();

  RxList<AnimeOngoing> animeOngoingList = <AnimeOngoing>[].obs;
  RxList<AnimeUpcoming> animeUpcomingList = <AnimeUpcoming>[].obs;

  @override
  void onInit() {
    Hive.registerAdapter(AnimeOngoingAdapter());
    Hive.registerAdapter(AnimeUpcomingAdapter());
    getAnime();
    super.onInit();
  }

  Future<void> getAnime() async {
    try {
      animeOngoingList.value = await animeApi.getAnimeOngoing();
      animeUpcomingList.value = await animeApi.getAnimeUpcoming();
      update();
    } catch (e) {
      print(e);
    }
  }
}
