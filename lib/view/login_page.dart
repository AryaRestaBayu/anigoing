import 'package:ani_going/routes.dart';
import 'package:ani_going/services/variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Setel warna status bar
        statusBarBrightness: Brightness.dark, // Setel kecerahan status bar
        statusBarIconBrightness:
            Brightness.light, // Setel warna ikon status bar
        systemNavigationBarColor:
            Colors.transparent, // Setel warna navigation bar
        systemNavigationBarIconBrightness:
            Brightness.light, // Setel warna ikon navigation bar
      ),
    );
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        // extendBodyBehindAppBar: true,

        body: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.srcOver),
              child: Container(
                height: sizeHeight,
                width: sizeWidth,
                child: Image(
                  image: AssetImage('assets/images/zero.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Container(
                // color: Colors.white,
                height: sizeHeight * 0.65,
                width: sizeWidth * .85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //google
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: PColor.primary),
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
                          Text(
                            'Continue with google',
                            style:
                                TextStyle(color: PColor.accent, fontSize: 13),
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
                          child: Divider(
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
                          child: Divider(
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
                            cursorColor: PColor.primary,
                            style: TextStyle(color: Colors.white),
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
                        child: TextField(
                            cursorColor: PColor.primary,
                            style: TextStyle(color: Colors.white),
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
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.visibility_rounded,
                                    color: PColor.accent,
                                  )),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: sizeHeight * 0.025,
                              ),
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: sizeHeight * .02),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.navbar);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black, fontSize: sizeWidth * .04),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PColor.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          minimumSize: Size(sizeWidth * .80, sizeHeight * .08),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: sizeHeight * .02),
                      child: Center(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: PColor.primary, fontSize: 14),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don`t have an account? ',
                          style: TextStyle(color: PColor.accent, fontSize: 13),
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(color: PColor.primary, fontSize: 13),
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
                style:
                    TextStyle(color: Colors.white, fontSize: sizeWidth * .06),
              ),
            )
          ],
        ),
      ),
    );
  }
}
