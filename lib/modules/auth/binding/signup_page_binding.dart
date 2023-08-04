part of auth;

class SignUpPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignUpPageController>(SignUpPageController());
  }
}
