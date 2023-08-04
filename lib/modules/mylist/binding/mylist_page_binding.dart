part of mylist;

class MyListPageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<MyListPageController>(MyListPageController());
  }
}
