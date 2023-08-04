import 'package:ani_going/modules/home/library_home.dart';
import 'package:ani_going/shared/binding/detail_anime_binding.dart';
import 'package:ani_going/modules/mylist/library_mylist.dart';
import 'package:ani_going/shared/binding/mylist_binding.dart';
import 'package:ani_going/modules/navbar/library_navbar.dart';
import 'modules/auth/library_auth.dart';
import 'package:get/get.dart';
import 'modules/setting/library_setting.dart';
import 'modules/detail_anime/library_detail_anime.dart';

class AppRoutes {
  static const navbar = '/navbar';
  static const detailAnimePage = '/detailAnimePage';
  static const seeAllPage = '/seeAllPage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';

  static final routes = [
    GetPage(
      name: navbar,
      page: () => Navbar(),
      bindings: [
        MyListBinding(),
        DetailAnimeBinding(),
        HomePageBinding(),
        NavbarBinding(),
        MyListPageBinding(),
        SettingPageBinding(),
      ],
    ),
    GetPage(
      name: detailAnimePage,
      page: () => DetailAnimePage(),
      binding: DetailAnimePageBinding(),
    ),
    GetPage(
      name: seeAllPage,
      page: () => const SeeAllPage(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: signUpPage,
      page: () => const SignUpPage(),
      binding: SignUpPageBinding(),
    )
  ];
}
