import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  Locale enLocale = Locale('en', 'US');
  Locale idLocale = Locale('id', 'ID');
  Locale? currentLocale = Get.locale;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'Login',
          'password': 'Password',
          'google': 'Continue with google',
          'forgotPassword': 'Forgot Password?',
          'signUp': 'Sign Up',
          'confirmPassword': 'Confirm Password',
          'dontHaveAccount': 'Don`t have an account? ',
          'haveAccount': 'Already have an account? ',
          'home': 'Home',
          'myList': 'My List',
          'settings': 'Settings',
          'ongoing': 'Ongoing',
          'upcoming': 'Upcoming',
          'seeAll': 'See all ➤',
          'language': 'Language',
          'notification': 'Notification',
          'notifConfig': 'Notification Configuration',
          'logout': 'Logout'
        },
        'id_ID': {
          'login': 'Masuk',
          'password': 'Kata Sandi',
          'google': 'Masuk dengan google',
          'forgotPassword': 'Lupa Kata Sandi?',
          'signUp': 'Daftar',
          'confirmPassword': 'Konfirmasi Kata Sandi',
          'dontHaveAccount': 'Belum punya akun? ',
          'haveAccount': 'Sudah punya akun? ',
          'home': 'Utama',
          'myList': 'List Ku',
          'settings': 'Pengaturan',
          'ongoing': 'Berlangsung',
          'upcoming': 'Mendatang',
          'seeAll': 'Lihat semua ➤',
          'language': 'Bahasa',
          'notification': 'Notifikasi',
          'notifConfig': 'Konfigurasi Notifikasi',
          'logout': 'Keluar'
        }
      };
}
