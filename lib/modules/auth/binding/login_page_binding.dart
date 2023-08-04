part of auth;

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginPageController>(LoginPageController());
  }
}
