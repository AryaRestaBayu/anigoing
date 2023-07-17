import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('isLogin');
    return isLogin ?? false;
  }

  Future<bool> setPrefs(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isLogin', isLogin);
  }

  Future<bool> removePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('isLogin');
  }

  Future<bool> setLocale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isEn', false);
  }

  Future<bool> removeLocale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('isEn');
  }

  Future<bool> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isEn = prefs.getBool('isEn');
    return isEn ?? true;
  }
}
