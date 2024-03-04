import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  Future<bool> setPreference() async {
    var prefs = await SharedPreferences.getInstance();
    var bool = prefs.setBool('bool', true);
    return bool;
  }

  Future<bool?> getPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    var bool = prefs.getBool('bool');
    return bool;
  }

  clearPref() async {
    var prefs = await SharedPreferences.getInstance();
 await prefs.remove('bool');
  }
}
