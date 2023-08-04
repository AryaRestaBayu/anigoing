import 'package:ani_going/shared/controller/mylist_controller.dart';
import 'package:get/get.dart';

class MyListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MyListController>(MyListController());
  }
}
