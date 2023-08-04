part of navbar;

class NavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavbarController());
  }
}
