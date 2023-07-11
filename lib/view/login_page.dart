import 'package:ani_going/controller/auth_controller.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isVisible = true.obs;
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
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
                  ElevatedButton(
                    onPressed: () {
                      authController.signInWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: PColor.primary),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minimumSize: Size(sizeWidth * .80, sizeHeight * .08),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: sizeWidth * 0.15,
                          height: sizeHeight * 0.05,
                        ),
                        const Text(
                          'Continue with google',
                          style: TextStyle(color: PColor.accent, fontSize: 13),
                        ),
                        SizedBox(
                          width: sizeWidth * 0.08,
                        )
                      ],
                    ),
                  ),
                  //line
                  Row(
                    children: [
                      SizedBox(
                        width: sizeWidth * 0.35,
                        child: const Divider(
                          color: PColor.primary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                        child: Text(
                          'or',
                          style: TextStyle(
                              color: PColor.accent,
                              fontSize: sizeWidth * 0.045),
                        ),
                      ),
                      SizedBox(
                        width: sizeWidth * 0.35,
                        child: const Divider(
                          color: PColor.primary,
                        ),
                      ),
                    ],
                  ),
                  //email
                  Container(
                      width: sizeWidth * .85,
                      height: sizeHeight * .08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: PColor.primary)),
                      padding: EdgeInsets.only(
                        right: sizeWidth * .03,
                        left: sizeWidth * .03,
                      ),
                      child: TextField(
                          controller: emailController,
                          cursorColor: PColor.primary,
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: PColor.accent,
                                fontSize: sizeWidth * .04),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: PColor.accent,
                              size: sizeWidth * .07,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: sizeHeight * 0.025,
                            ),
                          ))),
                  Container(
                      width: sizeWidth * .85,
                      height: sizeHeight * .08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: PColor.primary)),
                      padding: EdgeInsets.only(
                        left: sizeWidth * .03,
                        right: sizeWidth * .03,
                      ),
                      child: Obx(() => TextField(
                          controller: passwordController,
                          cursorColor: PColor.primary,
                          obscureText: isVisible.value ? true : false,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: PColor.accent,
                                fontSize: sizeWidth * .04),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: PColor.accent,
                              size: sizeWidth * .07,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isVisible.value = !isVisible.value;
                                },
                                icon: isVisible.value == true
                                    ? const Icon(
                                        Icons.visibility_off_outlined,
                                        color: PColor.accent,
                                      )
                                    : const Icon(
                                        Icons.visibility_outlined,
                                        color: PColor.accent,
                                      )),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: sizeHeight * 0.025,
                            ),
                          )))),
                  Padding(
                    padding: EdgeInsets.only(top: sizeHeight * .02),
                    child: ElevatedButton(
                      onPressed: () {
                        authController.signInWithEmail(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PColor.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        minimumSize: Size(sizeWidth * .80, sizeHeight * .08),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black, fontSize: sizeWidth * .04),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: sizeHeight * .02),
                    child: const Center(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: PColor.primary, fontSize: 14),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don`t have an account? ',
                        style: TextStyle(color: PColor.accent, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () => Get.offNamed(AppRoutes.signUpPage),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: PColor.primary, fontSize: 13),
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
              'Login',
              style: TextStyle(color: Colors.white, fontSize: sizeWidth * .06),
            ),
          )
        ],
      ),
    );
  }
}
