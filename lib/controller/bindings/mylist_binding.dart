import 'package:ani_going/controller/mylist_controller.dart';
import 'package:get/get.dart';

class MyListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyListController());
  }
}
