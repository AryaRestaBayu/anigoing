import 'package:ani_going/controller/detail_anime_controller.dart';
import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:ani_going/services/api/anime_api.dart';
import 'package:ani_going/services/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailAnimeController detailAnimeController =
        Get.find<DetailAnimeController>();
    final arguments = Get.arguments;
    final bool isOngoing = arguments['ongoing'];

    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(
              top: sizeHeight * 0.02,
              left: sizeWidth * 0.05,
              right: sizeWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // color: Colors.red,
                height: sizeHeight * 0.07,
                child: Text(
                  isOngoing ? 'Ongoing' : 'Upcoming',
                  style: const TextStyle(color: PColor.primary, fontSize: 22),
                ),
              ),
              Expanded(child: GetBuilder<AnimeApi>(builder: (controller) {
                return ListView.builder(
                    itemCount: isOngoing
                        ? controller.animeOngoingList.length
                        : controller.animeUpcomingList.length,
                    itemBuilder: (context, index) {
                      AnimeOngoing animeOngoing =
                          controller.animeOngoingList[index];
                      AnimeUpcoming animeUpcoming =
                          controller.animeUpcomingList[index];

                      return GestureDetector(
                        onTap: () {
                          isOngoing
                              ? detailAnimeController.sendArgument(
                                  isOngoing: true.obs,
                                  isMyList: false.obs,
                                  animeOngoing: animeOngoing,
                                )
                              : detailAnimeController.sendArgument(
                                  isOngoing: false.obs,
                                  isMyList: false.obs,
                                  animeUpcoming: animeUpcoming,
                                );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: sizeHeight * .02),
                          child: Row(
                            children: [
                              //image
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //title
                                    Text(
                                      isOngoing
                                          ? animeOngoing.title
                                          : animeUpcoming.title,
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
                                        color: PColor.accent,
                                      ),
                                    ),
                                    Text(
                                      isOngoing
                                          ? animeOngoing.type
                                          : animeUpcoming.type,
                                      style:
                                          const TextStyle(color: PColor.accent),
                                    ),
                                    Text(
                                      isOngoing
                                          ? '${animeOngoing.day}-${animeOngoing.month}-${animeOngoing.year}'
                                          : '${animeUpcoming.day}-${animeUpcoming.month}-${animeUpcoming.year}',
                                      style:
                                          const TextStyle(color: PColor.accent),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }))
            ],
          ),
        ),
      ),
    );
  }
}
