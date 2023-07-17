import 'package:ani_going/controller/bindings/auth_binding.dart';
import 'package:ani_going/controller/translations_controller.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/prefs.dart';
import 'package:ani_going/services/translations.dart';
import 'package:ani_going/services/utilities.dart';
import 'package:ani_going/services/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(TranslationsController());
  bool isLogin = await SharePref().getPrefs();
  bool isEn = await SharePref().getLocale();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp(
    isLogin: isLogin,
    isEn: isEn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  final bool isEn;
  const MyApp({super.key, required this.isLogin, required this.isEn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: isEn == true
          ? TranslationService().enLocale
          : TranslationService().idLocale,
      fallbackLocale: TranslationService().enLocale,
      theme:
          ThemeData(fontFamily: 'NunitoSans', highlightColor: AppColor.primary),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utilities.messengerKey,
      initialRoute: isLogin == true ? AppRoutes.navbar : AppRoutes.loginPage,
      initialBinding: AuthBinding(),
      getPages: AppRoutes.routes,
    );
  }
}
