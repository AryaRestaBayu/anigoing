import 'package:ani_going/controller/mylist_controller.dart';
import 'package:ani_going/model/mylist_model.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/variable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListPage extends StatelessWidget {
  MyListPage({Key? key}) : super(key: key);

  final myListControl = Get.find<MyListController>();

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
              Container(
                height: sizeHeight * 0.07,
                child: Text(
                  'My List',
                  style: TextStyle(color: PColor.primary, fontSize: 22),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<MyList>>(
                  stream: myListControl.getMyList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MyList>? myList = snapshot.data;
                      return ListView.builder(
                        itemCount: myList!.length,
                        itemBuilder: (context, index) {
                          MyList myListItem = myList[index];

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.detailAnimePage,
                                arguments: myListItem,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: sizeHeight * .02,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: Container(
                                      width: sizeWidth * .35,
                                      height: sizeHeight * .25,
                                      child: Image.network(
                                        myListItem.imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: sizeWidth * .05,
                                  ),
                                  Container(
                                    width: sizeWidth * .50,
                                    height: sizeHeight * .25,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          myListItem.title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: sizeWidth * 0.05,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          myListItem.episode.toString() +
                                              ' Episodes',
                                          style: TextStyle(
                                            color: PColor.accent,
                                          ),
                                        ),
                                        Text(
                                          myListItem.type,
                                          style: TextStyle(
                                            color: PColor.accent,
                                          ),
                                        ),
                                        Text(
                                          '${myListItem.day}-${myListItem.month}-${myListItem.year}',
                                          style: TextStyle(
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
                      return CircularProgressIndicator();
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
