import 'package:ani_going/controller/bindings/anime_api_binding.dart';
import 'package:ani_going/controller/bindings/auth_binding.dart';
import 'package:ani_going/controller/bindings/mylist_binding.dart';
import 'package:ani_going/controller/bindings/navbar_binding.dart';
import 'package:ani_going/controller/bindings/player_binding.dart';
import 'package:ani_going/view/detail_anime_page.dart';
import 'package:ani_going/view/login_page.dart';
import 'package:ani_going/view/navbar.dart';
import 'package:ani_going/view/see_all_page.dart';
import 'package:ani_going/view/signup_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const navbar = '/navbar';
  static const homePage = '/homePage';
  static const detailAnimePage = '/detailAnimePage';
  static const seeAllPage = '/seeAllPage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';

  static final routes = [
    GetPage(
      name: navbar,
      page: () => Navbar(),
      bindings: [
        NavbarBinding(),
        AnimeApiBinding(),
        MyListBinding(),
      ],
    ),
    GetPage(
      name: detailAnimePage,
      page: () => DetailAnimePage(),
      binding: PlayerBinding(),
    ),
    GetPage(
      name: seeAllPage,
      page: () => SeeAllPage(),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: signUpPage,
      page: () => SignUpPage(),
      binding: AuthBinding(),
    )
  ];
}
