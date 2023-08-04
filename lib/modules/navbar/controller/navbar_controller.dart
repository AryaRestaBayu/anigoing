part of navbar;

class NavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectedItem(int index) {
    selectedIndex.value = index;
  }
}
