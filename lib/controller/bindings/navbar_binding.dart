import 'package:ani_going/controller/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavbarController());
  }
}
