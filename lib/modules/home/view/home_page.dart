part of home;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final style = const TextStyle(fontSize: 20, color: AppColor.primary);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
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
                      fontSize: sizeWidth * 0.05,
                      color: AppColor.primary,
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
                    Header(style: style, ongoing: true),
                    GetBuilder<HomePageController>(
                        init: HomePageController(),
                        builder: (controller) {
                          if (controller.animeOngoingList.isNotEmpty) {
                            return ListAnime1(
                                ongoing: true,
                                sizeHeight: sizeHeight,
                                sizeWidth: sizeWidth);
                          }
                          return Center(
                            child: SizedBox(
                              height: sizeHeight * 0.30,
                              child: Center(
                                child: SharedWidget.widgetLoading(),
                              ),
                            ),
                          );
                        }),
                    Header(style: style, ongoing: false),
                    GetBuilder<HomePageController>(
                        init: HomePageController(),
                        builder: (controller) {
                          if (controller.animeUpcomingList.isNotEmpty) {
                            return ListAnime1(
                                ongoing: false,
                                sizeHeight: sizeHeight,
                                sizeWidth: sizeWidth);
                          }
                          return Center(
                            child: SizedBox(
                              height: sizeHeight * 0.30,
                              child: Center(
                                child: SharedWidget.widgetLoading(),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
