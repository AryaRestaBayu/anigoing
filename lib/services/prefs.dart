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

  Future<void> saveLastApiCallTimeOngoing(DateTime time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastApiCallTimeOngoing', time.toIso8601String());
  }

  Future<DateTime?> getLastApiCallTimeOngoing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String isoTime = prefs.getString('lastApiCallTimeOngoing') ?? '';
    if (isoTime.isNotEmpty) {
      return DateTime.parse(isoTime);
    }
    return null; // Nilai default jika belum ada penyimpanan sebelumnya
  }

  Future<void> saveLastApiCallTimeUpcoming(DateTime time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastApiCallTimeUpcoming', time.toIso8601String());
  }

  Future<DateTime?> getLastApiCallTimeUpcoming() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String isoTime = prefs.getString('lastApiCallTimeUpcoming') ?? '';
    if (isoTime.isNotEmpty) {
      return DateTime.parse(isoTime);
    }
    return null; // Nilai default jika belum ada penyimpanan sebelumnya
  }
}
