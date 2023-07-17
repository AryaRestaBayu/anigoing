import 'package:ani_going/services/color.dart';
import 'package:ani_going/view/home_page.dart';
import 'package:ani_going/view/mylist_page.dart';
import 'package:ani_going/view/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:ani_going/controller/navbar_controller.dart';
import 'package:get/get.dart';

class Navbar extends GetView<NavbarController> {
  Navbar({super.key});

  final pages = [
    HomePage(),
    MyListPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          Obx(
            () => pages.elementAt(controller.selectedIndex.value),
          ),
          Align(
            alignment: const Alignment(0.0, 0.9),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary),
                  borderRadius: BorderRadius.circular(40)),
              width: sizeWidth * 0.70,
              height: sizeHeight * 0.10,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Obx(
                    () => BottomNavigationBar(
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'home'.tr),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.bookmark), label: 'myList'.tr),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.settings), label: 'settings'.tr),
                      ],
                      currentIndex: controller.selectedIndex.value,
                      backgroundColor: Colors.black.withOpacity(0.20),
                      selectedItemColor: AppColor.primary,
                      unselectedItemColor: Colors.white,
                      selectedLabelStyle: TextStyle(fontSize: 12),
                      showUnselectedLabels: false,
                      showSelectedLabels: true,
                      onTap: controller.selectedItem,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
