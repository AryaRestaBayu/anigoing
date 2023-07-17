import 'package:ani_going/controller/detail_anime_controller.dart';
import 'package:ani_going/controller/mylist_controller.dart';
import 'package:ani_going/controller/player_controller.dart';
import 'package:ani_going/services/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class DetailAnimePage extends GetView<DetailAnimeController> {
  DetailAnimePage({super.key});

  // final controller = Get.find<DetailAnimeController>();
  final myListController = Get.find<MyListController>();

  @override
  Widget build(BuildContext context) {
    controller.getArgument();
    myListController.getTitle(controller.title!);
    final podPlayerController = Get.find<PlayerController>();
    podPlayerController.getPlayer(controller.isOngoing, controller.isMyList,
        controller.animeOngoing, controller.animeUpcoming, controller.myList);

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
                        controller.isMyList.value
                            ? controller.myList!.title
                            : controller.isOngoing.value
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
                          controller.isMyList.value == true
                              ? myListController.deleteMyList(controller.myList)
                              : myListController.addMyList(
                                  controller.isOngoing.value,
                                  controller.animeOngoing,
                                  controller.animeUpcoming);
                        },
                        child: Container(
                            height: sizeHeight * 0.06,
                            width: sizeWidth * 0.12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColor.primary)),
                            child: Obx(
                              () => Icon(
                                myListController.isAdded.value == true
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
                          itemCount: controller.isMyList.value
                              ? controller.myList!.genre.length
                              : controller.isOngoing.value
                                  ? controller.animeOngoing!.genre.length
                                  : controller.animeUpcoming!.genre.length,
                          itemBuilder: (context, index) {
                            String name = controller.isMyList.value
                                ? controller.myList!.genre[index]['name']
                                : controller.isOngoing.value
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
                        controller.isMyList.value
                            ? controller.myList!.synopsis
                            : controller.isOngoing.value
                                ? controller.animeOngoing!.synopsis
                                : controller.animeUpcoming!.synopsis,
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
