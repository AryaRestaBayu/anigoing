import 'package:ani_going/translation/en_translation.dart';
import 'package:ani_going/translation/id_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  Locale enLocale = Locale('en', 'US');
  Locale idLocale = Locale('id', 'ID');
  Locale? currentLocale = Get.locale;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnTranslation.translation,
        'id_ID': IdTranslation.translation,
      };
  //ui text
  static const login = 'login';
  static const signUp = 'signUp';
  static const logout = 'logout';
  static const password = 'password';
  static const confirmPassword = 'confirmPassword';
  static const forgotPassword = 'forgotPassword';
  static const google = 'google';
  static const haveAccount = 'haveAccount';
  static const dontHaveAccount = 'dontHaveAccount';
  static const home = 'home';
  static const myList = 'myList';
  static const setting = 'setting';
  static const ongoing = 'ongoing';
  static const upcoming = 'upcoming';
  static const seeAll = 'seeAll';
  static const language = 'language';
  static const notification = 'notification';
  static const notifConfig = 'notifConfig';

  //snackbar text
  static const wrongPassword = 'wrongPassword';
  static const passwordDoesntMatch = 'passwordDoesntMatch';
  static const welcome = 'welcome';
  static const byebye = 'byebye';
  static const alreadyInMyList = 'alreadyInMyList';
  static const addToMyList = 'addToMyList';
  static const deleteMyList = 'deleteMyList';
  // static const  = 'signin';
}
