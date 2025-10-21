import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late final SharedPreferences? prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await prefs?.setString(key, value);
  }

  static getString(String key) {
    return prefs?.getString(key);
  }

  static removeString(String key) async {
    await prefs?.remove(key);
  }
}
