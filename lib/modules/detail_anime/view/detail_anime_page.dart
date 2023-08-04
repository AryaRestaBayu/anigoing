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
                      GestureDetector(
                        onTap: () {
                          controller.detailAnimeController.isMyList.value ==
                                  true
                              ? controller.myListController.deleteMyList(
                                  controller.detailAnimeController.myList)
                              : controller.myListController.addMyList(
                                  controller
                                      .detailAnimeController.isOngoing.value,
                                  controller.detailAnimeController.animeOngoing,
                                  controller
                                      .detailAnimeController.animeUpcoming);
                        },
                        child: Container(
                            height: sizeHeight * 0.06,
                            width: sizeWidth * 0.12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColor.primary)),
                            child: Obx(
                              () => Icon(
                                controller.myListController.isAdded.value ==
                                        true
                                    ? Icons.bookmark_added
                                    : Icons.bookmark_add,
                                color: AppColor.accent,
                              ),
                            )),
                      ),

                      SizedBox(
                        height: sizeHeight * 0.02,
                      ),
                      //genre
                      SizedBox(
                        width: sizeWidth,
                        height: sizeHeight * 0.03,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller
                                  .detailAnimeController.isMyList.value
                              ? controller
                                  .detailAnimeController.myList!.genre.length
                              : controller.detailAnimeController.isOngoing.value
                                  ? controller.detailAnimeController
                                      .animeOngoing!.genre.length
                                  : controller.detailAnimeController
                                      .animeUpcoming!.genre.length,
                          itemBuilder: (context, index) {
                            String name =
                                controller.detailAnimeController.isMyList.value
                                    ? controller.detailAnimeController.myList!
                                        .genre[index]['name']
                                    : controller.detailAnimeController.isOngoing
                                            .value
                                        ? controller.detailAnimeController
                                            .animeOngoing!.genre[index]['name']
                                        : controller
                                            .detailAnimeController
                                            .animeUpcoming!
                                            .genre[index]['name'];
                            return Padding(
                              padding: EdgeInsets.only(right: sizeWidth * 0.02),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 4, left: 4, top: 1, bottom: 1),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primary),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.secondary,
                                ),
                                child: Center(
                                  child: Text(
                                    name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
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
