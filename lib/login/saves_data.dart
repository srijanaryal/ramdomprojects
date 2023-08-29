import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  ///get UserID

  static Future<void> saveUserid(String id) async {
    await preferences!.setString("userId", id);
  }

  static String getUserId() {
    return preferences!.getString('userID') ?? "";
  }

  static Future<void> saveUserName(String name) async {
    await preferences!.setString("name", name);
  }

  static String getUserName() {
    return preferences!.getString('userID') ?? "";
  }

  static Future<void> saveUserEmail(String email) async {
    await preferences!.setString("email", email);
  }

  static Future<void> getUserEmail(String email) async {
    await preferences!.setString("email", email);
  }
}

