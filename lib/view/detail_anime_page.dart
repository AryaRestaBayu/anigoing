import 'package:ani_going/controller/player_controller.dart';
import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:ani_going/services/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class DetailAnimePage extends StatelessWidget {
  const DetailAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final AnimeOngoing? animeOngoing = arguments?['animeOngoing'];
    final AnimeUpcoming? animeUpcoming = arguments?['animeUpcoming'];
    final bool isOngoing = arguments['ongoing'];

    final podPlayerController = Get.find<PlayerController>();

    if (isOngoing) {
      if (animeOngoing?.trailer != '-') {
        podPlayerController.playerController = PodPlayerController(
          podPlayerConfig: const PodPlayerConfig(
            videoQualityPriority: [360, 480],
            autoPlay: false,
            isLooping: false,
          ),
          playVideoFrom: PlayVideoFrom.youtube(animeOngoing!.trailer!),
        )..initialise();
        print(animeOngoing.trailer);
      }
    } else {
      if (animeUpcoming?.trailer != '-') {
        podPlayerController.playerController = PodPlayerController(
          podPlayerConfig: const PodPlayerConfig(
            videoQualityPriority: [360, 480],
            autoPlay: false,
            isLooping: false,
          ),
          playVideoFrom: PlayVideoFrom.youtube(animeUpcoming!.trailer!),
        )..initialise();
        print(animeUpcoming.trailer);
      }
    }

    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            //trailer
            Container(
              width: sizeWidth,
              height: sizeHeight * 0.30,
              child: podPlayerController.playerController != null
                  ? PodVideoPlayer(
                      controller: podPlayerController.playerController!)
                  : Center(
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
                        isOngoing ? animeOngoing!.title : animeUpcoming!.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.03,
                      ),
                      //genre
                      Container(
                        width: sizeWidth,
                        height: sizeHeight * 0.03,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: isOngoing
                              ? animeOngoing!.genre.length
                              : animeUpcoming!.genre.length,
                          itemBuilder: (context, index) {
                            String name = isOngoing
                                ? animeOngoing!.genre[index]['name']
                                : animeUpcoming!.genre[index]['name'];
                            return Padding(
                              padding: EdgeInsets.only(right: sizeWidth * 0.02),
                              child: Container(
                                padding: EdgeInsets.only(
                                    right: 4, left: 4, top: 1, bottom: 1),
                                decoration: BoxDecoration(
                                  border: Border.all(color: PColor.primary),
                                  borderRadius: BorderRadius.circular(10),
                                  color: PColor.secondary,
                                ),
                                child: Center(
                                  child: Text(
                                    name,
                                    style: TextStyle(
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
                        isOngoing
                            ? animeOngoing!.synopsis
                            : animeUpcoming!.synopsis,
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
