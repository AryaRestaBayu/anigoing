part of detail_anime;

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({
    super.key,
    required this.controller,
  });

  final DetailAnimePageController controller;

  @override
  Widget build(BuildContext context) {
    double sizeHeight = Get.height;
    double sizeWidth = Get.width;
    return GestureDetector(
      onTap: () {
        controller.detailAnimeController.isMyList.value == true
            ? controller.myListController
                .deleteMyList(controller.detailAnimeController.myList)
            : controller.myListController.addMyList(
                controller.detailAnimeController.isOngoing.value,
                controller.detailAnimeController.animeOngoing,
                controller.detailAnimeController.animeUpcoming);
      },
      child: Container(
          height: sizeHeight * 0.06,
          width: sizeWidth * 0.12,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primary)),
          child: Obx(
            () => Icon(
              controller.myListController.isAdded.value == true
                  ? Icons.bookmark_added
                  : Icons.bookmark_add,
              color: AppColor.accent,
            ),
          )),
    );
  }
}
