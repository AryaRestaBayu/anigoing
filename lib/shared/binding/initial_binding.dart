import 'package:ani_going/shared/controller/auth_controller.dart';
import 'package:ani_going/shared/controller/translations_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<TranslationsController>(TranslationsController());
  }
}
