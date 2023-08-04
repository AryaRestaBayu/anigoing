part of auth;

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return GetBuilder<TranslationsController>(
        builder: (translationsController) {
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
                height: sizeHeight * 0.70,
                width: sizeWidth * .85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: sizeHeight * 0.03,
                    ),
                    //google
                    CustomButton.signInWithGoogle(
                      controller.signInWithGoogle(),
                    ),
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
                    Padding(
                        padding: EdgeInsets.only(top: sizeHeight * .02),
                        child: CustomButton.signInwithEmail(
                          ontap: controller.signInWithEmail(),
                          text: AppTranslation.login,
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: sizeHeight * .02),
                      child: Center(
                        child: Text(
                          AppTranslation.forgotPassword.tr,
                          style:
                              TextStyle(color: AppColor.primary, fontSize: 14),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTranslation.dontHaveAccount.tr,
                          style: const TextStyle(
                              color: AppColor.accent, fontSize: 13),
                        ),
                        GestureDetector(
                          onTap: () => Get.offNamed(AppRoutes.signUpPage),
                          child: Text(
                            AppTranslation.signUp.tr,
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
                AppTranslation.login.tr,
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
