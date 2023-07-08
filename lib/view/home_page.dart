import 'dart:ui';

import 'package:ani_going/controller/detail_anime_controller.dart';
import 'package:ani_going/model/anime_ongoing_model.dart';
import 'package:ani_going/model/anime_upcoming_model.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/api/anime_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/variable.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final style = TextStyle(fontSize: 20, color: PColor.primary);
  final detailAnimeController = Get.find<DetailAnimeController>();

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: <Widget>[
        //image anigoing
        SliverAppBar(
          expandedHeight: sizeHeight * 0.28,
          pinned: true,
          floating: false,
          leading: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            title: Text(
              'AniGoing',
              style: TextStyle(
                  fontSize: 20,
                  color: PColor.primary,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        //ongoing
        SliverToBoxAdapter(
          child: SizedBox(
            height: sizeHeight * 0.90,
            width: sizeWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ongoing',
                        style: style,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.seeAllPage, arguments: {
                            'ongoing': true,
                          });
                        },
                        child: Text(
                          'See all ➤',
                          style: TextStyle(color: PColor.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                //anime ongoing
                SizedBox(
                    height: sizeHeight * 0.30,
                    width: sizeWidth,
                    child: GetBuilder<AnimeApi>(builder: (controller) {
                      return ListView.builder(
                          itemCount: controller.animeOngoingList.length < 3
                              ? controller.animeOngoingList.length
                              : 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            //urutkan list berdasarkan score
                            final sortedAnimeList = controller.animeOngoingList
                              ..sort((a, b) => b.score.compareTo(a.score));
                            AnimeOngoing animeOngoing = sortedAnimeList[index];
                            return GestureDetector(
                              onTap: () {
                                detailAnimeController.sendArgument(
                                    isMyList: false,
                                    isOngoing: true,
                                    animeOngoing: animeOngoing);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: sizeWidth * 0.03),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
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
                                            animeOngoing.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        //score
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: sizeWidth * 0.02,
                                              top: sizeHeight * 0.01),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 8.0, sigmaY: 8.0),
                                              child: Container(
                                                width: sizeWidth * 0.1,
                                                height: sizeHeight * 0.04,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                  colors: [
                                                    Colors.grey
                                                        .withOpacity(0.5),
                                                    Colors.black
                                                        .withOpacity(0.7),
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                )),
                                                child: Center(
                                                  child: Text(
                                                    animeOngoing.score
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
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
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  border: Border(
                                                      top: BorderSide(
                                                    color: PColor.primary,
                                                    width: 2,
                                                  ))),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: sizeWidth * 0.01,
                                                      right: sizeWidth * 0.01),
                                                  child: SingleChildScrollView(
                                                    child: Text(
                                                      animeOngoing.title,
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
                          });
                    })),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming',
                        style: style,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.seeAllPage, arguments: {
                            'ongoing': false,
                          });
                        },
                        child: Text(
                          'See all ➤',
                          style: TextStyle(color: PColor.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                //anime upcoming
                SizedBox(
                    height: sizeHeight * 0.30,
                    width: sizeWidth,
                    child: GetBuilder<AnimeApi>(builder: (controller) {
                      return ListView.builder(
                          itemCount: controller.animeUpcomingList.length < 3
                              ? controller.animeUpcomingList.length
                              : 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final AnimeUpcoming animeUpcoming =
                                controller.animeUpcomingList[index];
                            return GestureDetector(
                              onTap: () {
                                detailAnimeController.sendArgument(
                                    isMyList: false,
                                    isOngoing: false,
                                    animeUpcoming: animeUpcoming);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: sizeWidth * 0.03),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
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
                                            animeUpcoming.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        //score
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: sizeWidth * 0.02,
                                              top: sizeHeight * 0.01),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 8.0, sigmaY: 8.0),
                                              child: Container(
                                                width: sizeWidth * 0.2,
                                                height: sizeHeight * 0.04,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                  colors: [
                                                    Colors.grey
                                                        .withOpacity(0.5),
                                                    Colors.black
                                                        .withOpacity(0.7),
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                )),
                                                child: Center(
                                                  child: Text(
                                                    '${animeUpcoming.day}-${animeUpcoming.month}-${animeUpcoming.year}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
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
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  border: Border(
                                                      top: BorderSide(
                                                    color: PColor.primary,
                                                    width: 2,
                                                  ))),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: sizeWidth * 0.01,
                                                      right: sizeWidth * 0.01),
                                                  child: SingleChildScrollView(
                                                    child: Text(
                                                      animeUpcoming.title,
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
                          });
                    }))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
