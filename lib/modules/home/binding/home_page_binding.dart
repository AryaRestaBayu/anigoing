part of home;

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomePageController>(HomePageController());
  }
}
