import 'package:ani_going/controller/bindings/auth_binding.dart';
import 'package:ani_going/controller/bindings/navbar_binding.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/variable.dart';
import 'package:ani_going/view/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:
          ThemeData(fontFamily: 'NunitoSans', highlightColor: PColor.primary),
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.loginPage,
      initialRoute: AppRoutes.loginPage,
      initialBinding: AuthBinding(),
      getPages: AppRoutes.routes,
    );
  }
}
