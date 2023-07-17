import 'package:ani_going/controller/auth_controller.dart';
import 'package:ani_going/controller/translations_controller.dart';
import 'package:ani_going/services/color.dart';
import 'package:ani_going/services/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return GetBuilder<TranslationsController>(builder: (translation) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.only(
                top: sizeHeight * 0.02,
                left: sizeWidth * 0.05,
                right: sizeWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeHeight * 0.05,
                  child: Text(
                    'settings'.tr,
                    style: TextStyle(color: AppColor.primary, fontSize: 22),
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Listtile(
                      ontap: () {
                        translation.changeLocale();
                      },
                      title: 'language'.tr,
                      subtitle: TranslationService().currentLocale ==
                              TranslationService().enLocale
                          ? 'English'
                          : 'Indonesia',
                    ),
                    Listtile(
                      ontap: () {},
                      title: 'notification'.tr,
                      subtitle: 'notifConfig'.tr,
                    ),
                    Listtile(
                      ontap: () {
                        authController.signOutGoogle();
                      },
                      title: 'logout'.tr,
                      subtitle: '',
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      );
    });
  }
}

class Listtile extends StatelessWidget {
  const Listtile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.ontap,
  });

  final String title;
  final String subtitle;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: subtitle == ''
                ? null
                : Text(
                    subtitle,
                    style: TextStyle(color: AppColor.accent),
                  ),
          ),
        ),
        const Divider(
          color: AppColor.accent,
        ),
      ],
    );
  }
}
