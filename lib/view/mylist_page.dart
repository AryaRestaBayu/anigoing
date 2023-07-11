import 'package:ani_going/controller/detail_anime_controller.dart';
import 'package:ani_going/controller/mylist_controller.dart';
import 'package:ani_going/model/mylist_model.dart';
import 'package:ani_going/services/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListPage extends StatelessWidget {
  MyListPage({Key? key}) : super(key: key);

  final myListControl = Get.find<MyListController>();
  final detailAnimeController = Get.find<DetailAnimeController>();

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(
            top: sizeHeight * 0.02,
            left: sizeWidth * 0.05,
            right: sizeWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizeHeight * 0.07,
                child: const Text(
                  'My List',
                  style: TextStyle(color: PColor.primary, fontSize: 22),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: myListControl.getMyList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MyList>? listMyList = snapshot.data;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: listMyList!.length,
                        itemBuilder: (context, index) {
                          MyList myList = listMyList[index];
                          return GestureDetector(
                            onTap: () {
                              detailAnimeController.sendArgument(
                                isOngoing: false.obs,
                                isMyList: true.obs,
                                title: myList.title,
                                myList: myList,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: sizeHeight * .02,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: SizedBox(
                                      width: sizeWidth * .35,
                                      height: sizeHeight * .25,
                                      child: Image.network(
                                        myList.imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: sizeWidth * .05,
                                  ),
                                  SizedBox(
                                    width: sizeWidth * .50,
                                    height: sizeHeight * .25,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          myList.title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: sizeWidth * 0.05,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          '${myList.episode.toString()} Episode',
                                          style: const TextStyle(
                                            color: PColor.accent,
                                          ),
                                        ),
                                        Text(
                                          myList.type,
                                          style: const TextStyle(
                                            color: PColor.accent,
                                          ),
                                        ),
                                        Text(
                                          '${myList.day}-${myList.month}-${myList.year}',
                                          style: const TextStyle(
                                            color: PColor.accent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
