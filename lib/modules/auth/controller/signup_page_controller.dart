part of auth;

class SignUpPageController extends GetxController {
  final authController = Get.find<AuthController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isVisible = true.obs;

  void signUpWithEmail() {
    if (passwordController.text != confirmPasswordController.text) {
      CustomSnackbar.snackBar(
          AppTranslation.passwordDoesntMatch, AppColor.error);
      return;
    }

    authController.signUpWithEmail(
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
    confirmPasswordController.dispose();
  }
}
