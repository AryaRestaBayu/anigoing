part of mylist;

class MyListPage extends GetView<MyListPageController> {
  const MyListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;

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
                child: Text(
                  AppTranslation.myList.tr,
                  style: const TextStyle(color: AppColor.primary, fontSize: 22),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: controller.myListController.getMyList(),
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
                              controller.detailAnimeController.sendArgument(
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
                                            color: AppColor.accent,
                                          ),
                                        ),
                                        Text(
                                          myList.type,
                                          style: const TextStyle(
                                            color: AppColor.accent,
                                          ),
                                        ),
                                        Text(
                                          '${myList.day}-${myList.month}-${myList.year}',
                                          style: const TextStyle(
                                            color: AppColor.accent,
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
