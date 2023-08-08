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
                      return ListAnime(
                        listMyList: listMyList,
                        controller: controller,
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Center(child: SharedWidget.widgetLoading());
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
