part of setting;

class SettingPageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SettingPageController>(SettingPageController());
  }
}
