part of auth;

class LoginPageController extends GetxController {
  final authController = Get.find<AuthController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isVisible = true.obs;

  void signInWithEmail() {
    authController.signInWithEmail(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  void changeVisibility() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
