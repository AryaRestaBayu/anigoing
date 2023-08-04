part of navbar;

class Navbar extends GetView<NavbarController> {
  Navbar({super.key});

  final pages = [
    const HomePage(),
    const MyListPage(),
    const SettingPage(),
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
                            icon: const Icon(Icons.home),
                            label: AppTranslation.home.tr),
                        BottomNavigationBarItem(
                            icon: const Icon(Icons.bookmark),
                            label: AppTranslation.myList.tr),
                        BottomNavigationBarItem(
                            icon: const Icon(Icons.settings),
                            label: AppTranslation.setting.tr),
                      ],
                      currentIndex: controller.selectedIndex.value,
                      backgroundColor: Colors.black.withOpacity(0.20),
                      selectedItemColor: AppColor.primary,
                      unselectedItemColor: Colors.white,
                      selectedLabelStyle: const TextStyle(fontSize: 12),
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
