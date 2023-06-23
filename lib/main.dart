import 'package:ani_going/controller/bindings/navbar_binding.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
      initialRoute: AppRoutes.loginPage,
      initialBinding: NavbarBinding(),
      getPages: AppRoutes.routes,
    );
  }
}
