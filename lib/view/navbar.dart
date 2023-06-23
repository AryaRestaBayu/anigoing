import 'package:ani_going/services/variable.dart';
import 'package:ani_going/view/home_page.dart';
import 'package:ani_going/view/mylist_page.dart';
import 'package:ani_going/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:ani_going/controller/navbar_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Navbar extends GetView<NavbarController> {
  Navbar({super.key});

  final pages = [
    HomePage(),
    MyList(),
    ProfilePage(),
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
            alignment: Alignment(0.0, 0.9),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: PColor.primary),
                  borderRadius: BorderRadius.circular(40)),
              width: sizeWidth * 0.70,
              height: sizeHeight * 0.09,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Obx(
                    () => BottomNavigationBar(
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.bookmark), label: 'my list'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.settings), label: 'profile'),
                      ],
                      currentIndex: controller.selectedIndex.value,
                      backgroundColor: Colors.black.withOpacity(0.20),
                      selectedItemColor: PColor.primary,
                      unselectedItemColor: Colors.white,
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
