import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorage {
  static final storage = GetStorage();

//SAVE DATA
  static void setData(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

//READ DATA
  static String? getString(String key) {
    final GetStorage storage = GetStorage();
    return storage.read(key);
  }

//SAVE DATA
  static Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static bool? getBool(String key) {
    final GetStorage storage = GetStorage();
    return storage.read(key);
  }

//SAVE DATA
  static Future<dynamic> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

//CLEAR DATA
  static void clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

//REMOVE DATA
  static void removeData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
