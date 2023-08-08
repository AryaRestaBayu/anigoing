part of detail_anime;

class Genre extends StatelessWidget {
  const Genre({
    super.key,
    required this.controller,
  });

  final DetailAnimePageController controller;

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = Get.width;
    final double sizeHeight = Get.height;
    return SizedBox(
      width: sizeWidth,
      height: sizeHeight * 0.03,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.detailAnimeController.isMyList.value
            ? controller.detailAnimeController.myList!.genre.length
            : controller.detailAnimeController.isOngoing.value
                ? controller.detailAnimeController.animeOngoing!.genre.length
                : controller.detailAnimeController.animeUpcoming!.genre.length,
        itemBuilder: (context, index) {
          String name = controller.detailAnimeController.isMyList.value
              ? controller.detailAnimeController.myList!.genre[index]['name']
              : controller.detailAnimeController.isOngoing.value
                  ? controller.detailAnimeController.animeOngoing!.genre[index]
                      ['name']
                  : controller.detailAnimeController.animeUpcoming!.genre[index]
                      ['name'];
          return Padding(
            padding: EdgeInsets.only(right: sizeWidth * 0.02),
            child: Container(
              padding:
                  const EdgeInsets.only(right: 4, left: 4, top: 1, bottom: 1),
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
    );
  }
}
