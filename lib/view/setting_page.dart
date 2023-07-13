import 'package:ani_going/controller/auth_controller.dart';
import 'package:ani_going/services/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

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
                child: const Text(
                  'Settings',
                  style: TextStyle(color: PColor.primary, fontSize: 22),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Listtile(
                    ontap: () {},
                    title: 'Language',
                    subtitle: 'English',
                  ),
                  Listtile(
                    ontap: () {},
                    title: 'Notification',
                    subtitle: 'Notification configuration',
                  ),
                  Listtile(
                    ontap: () {
                      authController.signOutGoogle();
                    },
                    title: 'Logout',
                    subtitle: '',
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
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
                    style: TextStyle(color: PColor.accent),
                  ),
          ),
        ),
        const Divider(
          color: PColor.accent,
        ),
      ],
    );
  }
}
