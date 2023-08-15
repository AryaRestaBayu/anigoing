part of auth;

class SignUpPage extends GetView<SignUpPageController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return GetBuilder<TranslationsController>(builder: (translationController) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.srcOver),
              child: SizedBox(
                height: sizeHeight,
                width: sizeWidth,
                child: const Image(
                  image: AssetImage('assets/images/zero.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                // color: Colors.white,
                height: sizeHeight * 0.75,
                width: sizeWidth * .85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: sizeHeight * 0.03,
                    ),
                    //google
                    CustomButton.signInWithGoogle(
                      onTap: () {
                        controller.authController.signInWithGoogle();
                      },
                    ),
                    //blue line
                    const CustomDivider(),
                    //email
                    CostumTextField(
                      textController: controller.emailController,
                      hint: 'Email',
                      prefixIcon: Icons.email_outlined,
                    ),
                    //password
                    Obx(
                      () => CostumTextField(
                        textController: controller.passwordController,
                        obscure: controller.isVisible.value,
                        visible: controller.isVisible.value,
                        ontap: () {
                          controller.changeVisibility();
                        },
                        hint: AppTranslation.password.tr,
                        prefixIcon: Icons.lock_outline,
                      ),
                    ),
                    //confirm password
                    Obx(
                      () => CostumTextField(
                        textController: controller.confirmPasswordController,
                        obscure: controller.isVisible.value,
                        visible: controller.isVisible.value,
                        ontap: () {
                          controller.changeVisibility();
                        },
                        hint: AppTranslation.confirmPassword.tr,
                        prefixIcon: Icons.lock_outline,
                      ),
                    ),
                    //button
                    Padding(
                      padding: EdgeInsets.only(top: sizeHeight * .02),
                      child: CustomButton.signInwithEmail(
                        ontap: () {
                          controller.signUpWithEmail();
                        },
                        text: AppTranslation.signUp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTranslation.haveAccount.tr,
                          style:
                              TextStyle(color: AppColor.accent, fontSize: 13),
                        ),
                        GestureDetector(
                          onTap: () => Get.offNamed(AppRoutes.loginPage),
                          child: Text(
                            AppTranslation.login.tr,
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: sizeHeight * .09,
              left: sizeWidth * 0.07,
              child: Text(
                AppTranslation.signUp.tr,
                style:
                    TextStyle(color: Colors.white, fontSize: sizeWidth * .06),
              ),
            )
          ],
        ),
      );
    });
  }
}
