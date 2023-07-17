import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('isLogin');
    return isLogin ?? false;
  }

  setPrefs(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', isLogin);
  }

  removePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
