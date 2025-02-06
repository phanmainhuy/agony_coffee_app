import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save a string value
  static Future<void> setText(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Get a string value
  static String? getText(String key) {
    return _prefs?.getString(key);
  }

  // Remove a string value
  static Future<void> removeText(String key) async {
    await _prefs?.remove(key);
  }
}
