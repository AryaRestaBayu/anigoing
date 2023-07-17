import 'package:ani_going/services/prefs.dart';
import 'package:ani_going/services/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationsController extends GetxController {
  final translation = TranslationService();

  @override
  void onInit() {
    translation.currentLocale = Locale('en', 'US');
    print(translation.currentLocale);
    super.onInit();
  }

  void changeLocale() {
    if (translation.currentLocale == translation.enLocale) {
      Get.updateLocale(translation.idLocale);
      translation.currentLocale = translation.idLocale;
      SharePref().setLocale();
      print('change id');
    } else if (translation.currentLocale == translation.idLocale) {
      Get.updateLocale(translation.enLocale);
      translation.currentLocale = translation.enLocale;
      SharePref().removeLocale();
      print('change en');
    }
    print('pressed');
    print(translation.currentLocale);
    update();
  }
}
