part of detail_anime;

class DetailAnimePage extends GetView<DetailAnimePageController> {
  const DetailAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            //trailer
            SizedBox(
              width: sizeWidth,
              height: sizeHeight * 0.30,
              child: controller.playerController.podPlayerController != null
                  ? PodVideoPlayer(
                      controller:
                          controller.playerController.podPlayerController!)
                  : const Center(
                      child: Text(
                        'Trailer not available',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
            //detail anime
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: sizeWidth,
                  color: Colors.black,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Text(
                        controller.detailAnimeController.isMyList.value
                            ? controller.detailAnimeController.myList!.title
                            : controller.detailAnimeController.isOngoing.value
                                ? controller
                                    .detailAnimeController.animeOngoing!.title
                                : controller
                                    .detailAnimeController.animeUpcoming!.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.01,
                      ),
                      //add my list
                      ButtonAdd(
                        controller: controller,
                      ),
                      SizedBox(
                        height: sizeHeight * 0.02,
                      ),
                      //genre
                      Genre(
                        controller: controller,
                      ),
                      SizedBox(
                        height: sizeHeight * 0.03,
                      ),
                      //synopsis
                      Text(
                        controller.detailAnimeController.isMyList.value
                            ? controller.detailAnimeController.myList!.synopsis
                            : controller.detailAnimeController.isOngoing.value
                                ? controller.detailAnimeController.animeOngoing!
                                    .synopsis
                                : controller.detailAnimeController
                                    .animeUpcoming!.synopsis,
                        style: const TextStyle(color: AppColor.accent),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
