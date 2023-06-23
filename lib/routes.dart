import 'package:ani_going/controller/bindings/anime_api_binding.dart';
import 'package:ani_going/controller/bindings/navbar_binding.dart';
import 'package:ani_going/controller/bindings/player_binding.dart';
import 'package:ani_going/view/detail_anime_page.dart';
import 'package:ani_going/view/login_page.dart';
import 'package:ani_going/view/navbar.dart';
import 'package:ani_going/view/see_all_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const navbar = '/navbar';
  static const homePage = '/homePage';
  static const detailAnimePage = '/detailAnimePage';
  static const seeAllPage = '/seeAllPage';
  static const loginPage = '/loginPage';

  static final routes = [
    GetPage(
      name: navbar,
      page: () => Navbar(),
      bindings: [NavbarBinding(), AnimeApiBinding()],
    ),
    GetPage(
      name: detailAnimePage,
      page: () => DetailAnimePage(),
      bindings: [PlayerBinding()],
    ),
    GetPage(
      name: seeAllPage,
      page: () => SeeAllPage(),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
    )
  ];
}
