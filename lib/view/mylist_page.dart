import 'package:ani_going/controller/mylist_controller.dart';
import 'package:ani_going/model/mylist_model.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/variable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

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
              right: sizeWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                height: sizeHeight * 0.07,
                child: Text(
                  'My List',
                  style: TextStyle(color: PColor.primary, fontSize: 22),
                ),
              ),
              Expanded(
                  child: GetBuilder<MyListController>(
                      init: MyListController(
                          //change value uid to uid current user
                          uid: FirebaseAuth.instance.currentUser!.uid),
                      builder: (controller) {
                        return ListView.builder(
                            itemCount: controller.myList.length,
                            itemBuilder: (context, index) {
                              MyList myList = controller.myList[index];

                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailAnimePage,
                                      arguments: myList);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: sizeHeight * .02),
                                  child: Row(
                                    children: [
                                      //image
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Container(
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
                                      //detail
                                      Container(
                                        width: sizeWidth * .50,
                                        height: sizeHeight * .25,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            //title
                                            Text(
                                              myList.title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: sizeWidth * 0.05,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            Text(
                                              myList.episode.toString() +
                                                  ' Episodes',
                                              style: TextStyle(
                                                color: PColor.accent,
                                              ),
                                            ),
                                            Text(
                                              myList.type,
                                              style: TextStyle(
                                                  color: PColor.accent),
                                            ),
                                            Text(
                                              '${myList.day}-${myList.month}-${myList.year}',
                                              style: TextStyle(
                                                  color: PColor.accent),
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
