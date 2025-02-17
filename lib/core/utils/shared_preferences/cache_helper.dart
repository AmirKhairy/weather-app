import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  // Initialize the sharedPreferences instance
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  ///
  ///
  ///
  ///

  // Save a boolean value
  static Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  // Retrieve a boolean value
  static bool? getBool({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }
  ///
  ///
  ///
  ///
  ///

  // Save an integer value
  static Future<bool> setInt({
    required String key,
    required int value,
  }) async {
    return await sharedPreferences!.setInt(key, value);
  }

  // Retrieve an integer value
  static int? getInt({
    required String key,
  }) {
    return sharedPreferences!.getInt(key);
  }
  ///
  ///
  ///
  ///
  ///

  // Save a double value
  static Future<bool> setDouble({
    required String key,
    required double value,
  }) async {
    return await sharedPreferences!.setDouble(key, value);
  }

  // Retrieve a double value
  static double? getDouble({
    required String key,
  }) {
    return sharedPreferences!.getDouble(key);
  }
  ///
  ///
  ///
  ///
  ///


  // Save a string value
  static Future<bool> setString({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences!.setString(key, value);
  }

  // Retrieve a string value
  static String? getString({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  // Save a list of strings
  static Future<bool> setStringList({
    required String key,
    required List<String> value,
  }) async {
    return await sharedPreferences!.setStringList(key, value);
  }

  // Retrieve a list of strings
  static List<String>? getStringList({
    required String key,
  }) {
    return sharedPreferences!.getStringList(key);
  }
  ///
  ///
  ///
  ///
  ///

  // Remove a specific key-value pair
  static Future<bool> remove({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
  ///
  ///
  ///
  ///




  // Clear all data in shared preferences
  static Future<bool> clear() async {
    return await sharedPreferences!.clear();
  }
  ///
  ///
  ///
  ///
  ///

  // Check if a key exists in shared preferences
  static bool containsKey({
    required String key,
  }) {
    return sharedPreferences!.containsKey(key);
  }
}
