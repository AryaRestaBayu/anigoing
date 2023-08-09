import 'package:ani_going/routes.dart';
import 'package:ani_going/services/prefs.dart';
import 'package:ani_going/shared/binding/initial_binding.dart';
import 'package:ani_going/translation/app_translation.dart';
import 'package:ani_going/utils/custom_snackbar.dart';
import 'package:ani_going/constant/AppColor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
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
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      translations: AppTranslation(),
      locale:
          isEn == true ? AppTranslation().enLocale : AppTranslation().idLocale,
      fallbackLocale: AppTranslation().enLocale,
      theme:
          ThemeData(fontFamily: 'NunitoSans', highlightColor: AppColor.primary),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: CustomSnackbar.messengerKey,
      initialRoute: isLogin == true ? AppRoutes.navbar : AppRoutes.loginPage,
      initialBinding: InitialBinding(),
      getPages: AppRoutes.routes,
    );
  }
}
