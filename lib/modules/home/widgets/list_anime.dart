part of home;

class ListAnime1 extends GetView<HomePageController> {
  const ListAnime1({
    required this.ongoing,
    required this.sizeHeight,
    required this.sizeWidth,
    super.key,
  });

  final bool ongoing;
  final double sizeHeight;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: sizeHeight * 0.30,
        width: sizeWidth,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: ongoing == false
                ? controller.animeUpcomingList.length < 3
                    ? controller.animeUpcomingList.length
                    : 10
                : controller.animeOngoingList.length < 3
                    ? controller.animeOngoingList.length
                    : 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final AnimeUpcoming animeUpcoming =
                  controller.animeUpcomingList[index];
              final AnimeOngoing animeOngoing =
                  controller.animeOngoingList[index];
              return GestureDetector(
                onTap: () {
                  ongoing == false
                      ? controller.detailAnimeController.sendArgument(
                          isMyList: false.obs,
                          isOngoing: false.obs,
                          title: animeUpcoming.title,
                          animeUpcoming: animeUpcoming)
                      : controller.detailAnimeController.sendArgument(
                          isMyList: false.obs,
                          isOngoing: true.obs,
                          title: animeOngoing.title,
                          animeOngoing: animeOngoing);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: sizeWidth * 0.03),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SizedBox(
                      width: sizeWidth * 0.38,
                      height: sizeHeight * 0.10,
                      child: Stack(
                        children: [
                          //image
                          SizedBox(
                            width: sizeWidth * 0.38,
                            height: sizeHeight * 0.30,
                            child: Image.network(
                              ongoing == false
                                  ? animeUpcoming.imageUrl
                                  : animeOngoing.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          //score
                          Padding(
                            padding: EdgeInsets.only(
                                left: sizeWidth * 0.02, top: sizeHeight * 0.01),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                                child: Container(
                                  width: ongoing == false
                                      ? sizeWidth * 0.2
                                      : sizeWidth * .1,
                                  height: sizeHeight * 0.04,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.withOpacity(0.5),
                                      Colors.black.withOpacity(0.7),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  )),
                                  child: Center(
                                    child: Text(
                                      ongoing == false
                                          ? '${animeUpcoming.day}-${animeUpcoming.month}-${animeUpcoming.year}'
                                          : '${animeOngoing.score}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //title
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipRRect(
                              child: Container(
                                width: sizeWidth,
                                height: sizeHeight * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.8),
                                    border: const Border(
                                        top: BorderSide(
                                      color: AppColor.primary,
                                      width: 2,
                                    ))),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: sizeWidth * 0.01,
                                        right: sizeWidth * 0.01),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        ongoing == false
                                            ? animeUpcoming.title
                                            : animeOngoing.title,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

//=========================================================================================

class ListAnime2 extends GetView<HomePageController> {
  const ListAnime2({
    super.key,
    required this.isOngoing,
    required this.sizeHeight,
    required this.sizeWidth,
  });

  final bool isOngoing;
  final double sizeHeight;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: isOngoing
            ? controller.animeOngoingList.length
            : controller.animeUpcomingList.length,
        itemBuilder: (context, index) {
          AnimeOngoing animeOngoing = controller.animeOngoingList[index];
          AnimeUpcoming animeUpcoming = controller.animeUpcomingList[index];

          return GestureDetector(
            onTap: () {
              isOngoing
                  ? controller.detailAnimeController.sendArgument(
                      isOngoing: true.obs,
                      isMyList: false.obs,
                      title: animeOngoing.title,
                      animeOngoing: animeOngoing,
                    )
                  : controller.detailAnimeController.sendArgument(
                      isMyList: false.obs,
                      isOngoing: false.obs,
                      title: animeUpcoming.title,
                      animeUpcoming: animeUpcoming,
                    );
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: sizeHeight * .02),
              child: Row(
                children: [
                  //image
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SizedBox(
                      width: sizeWidth * .35,
                      height: sizeHeight * .25,
                      child: Image.network(
                        isOngoing
                            ? animeOngoing.imageUrl
                            : animeUpcoming.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sizeWidth * .05,
                  ),
                  //detail
                  SizedBox(
                    width: sizeWidth * .50,
                    height: sizeHeight * .25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //title
                        Text(
                          isOngoing ? animeOngoing.title : animeUpcoming.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: sizeWidth * 0.05,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          isOngoing
                              ? '${animeOngoing.episode} Episodes'
                              : '${animeUpcoming.episode} Episodes',
                          style: const TextStyle(
                            color: AppColor.accent,
                          ),
                        ),
                        Text(
                          isOngoing ? animeOngoing.type : animeUpcoming.type,
                          style: const TextStyle(color: AppColor.accent),
                        ),
                        Text(
                          isOngoing
                              ? '${animeOngoing.day}-${animeOngoing.month}-${animeOngoing.year}'
                              : '${animeUpcoming.day}-${animeUpcoming.month}-${animeUpcoming.year}',
                          style: const TextStyle(color: AppColor.accent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
