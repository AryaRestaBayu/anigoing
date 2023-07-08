import 'package:ani_going/controller/detail_anime_controller.dart';
import 'package:ani_going/controller/mylist_controller.dart';
import 'package:ani_going/controller/player_controller.dart';
import 'package:ani_going/services/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class DetailAnimePage extends GetView<DetailAnimeController> {
  const DetailAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getArgument();
    final podPlayerController = Get.find<PlayerController>();
    podPlayerController.getPlayer(controller.isOngoing, controller.isMyList,
        controller.animeOngoing, controller.animeUpcoming, controller.myList);
    final myListController = Get.find<MyListController>();

    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            //trailer
            SizedBox(
              width: sizeWidth,
              height: sizeHeight * 0.30,
              child: podPlayerController.playerController != null
                  ? PodVideoPlayer(
                      controller: podPlayerController.playerController!)
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
                        controller.isMyList
                            ? controller.myList!.title
                            : controller.isOngoing
                                ? controller.animeOngoing!.title
                                : controller.animeUpcoming!.title,
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
                          myListController.addMyList(
                              controller.isOngoing,
                              controller.animeOngoing,
                              controller.animeUpcoming);
                        },
                        child: Container(
                          height: sizeHeight * 0.06,
                          width: sizeWidth * 0.12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: PColor.primary)),
                          child: Icon(
                            Icons.bookmark_add,
                            color: PColor.accent,
                          ),
                        ),
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
                          itemCount: controller.isMyList
                              ? controller.myList!.genre.length
                              : controller.isOngoing
                                  ? controller.animeOngoing!.genre.length
                                  : controller.animeUpcoming!.genre.length,
                          itemBuilder: (context, index) {
                            String name = controller.isMyList
                                ? controller.myList!.genre[index]['name']
                                : controller.isOngoing
                                    ? controller.animeOngoing!.genre[index]
                                        ['name']
                                    : controller.animeUpcoming!.genre[index]
                                        ['name'];
                            return Padding(
                              padding: EdgeInsets.only(right: sizeWidth * 0.02),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 4, left: 4, top: 1, bottom: 1),
                                decoration: BoxDecoration(
                                  border: Border.all(color: PColor.primary),
                                  borderRadius: BorderRadius.circular(10),
                                  color: PColor.secondary,
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
                        controller.isMyList
                            ? controller.myList!.synopsis
                            : controller.isOngoing
                                ? controller.animeOngoing!.synopsis
                                : controller.animeUpcoming!.synopsis,
                        style: TextStyle(color: PColor.accent),
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
