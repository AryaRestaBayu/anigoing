part of home;

class SeeAllPage extends GetView<HomePageController> {
  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final bool isOngoing = arguments['ongoing'];

    double sizeWidth = Get.width;
    double sizeHeight = Get.height;

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
                height: sizeHeight * 0.07,
                child: Text(
                  isOngoing
                      ? AppTranslation.ongoing.tr
                      : AppTranslation.upcoming.tr,
                  style: const TextStyle(color: AppColor.primary, fontSize: 22),
                ),
              ),
              Expanded(
                  child: GetBuilder<HomePageController>(builder: (controller) {
                return ListAnime2(
                    isOngoing: isOngoing,
                    sizeHeight: sizeHeight,
                    sizeWidth: sizeWidth);
              }))
            ],
          ),
        ),
      ),
    );
  }
}
