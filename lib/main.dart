import 'package:ani_going/controller/bindings/auth_binding.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/prefs.dart';
import 'package:ani_going/services/utilities.dart';
import 'package:ani_going/services/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  bool isLogin = await SharePref().getPrefs();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('id'),
      ],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      useOnlyLangCode: true,
      child: MyApp(isLogin: isLogin),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
