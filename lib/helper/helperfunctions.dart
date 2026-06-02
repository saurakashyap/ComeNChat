import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";

  // saving data to SharedPreference
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(
      String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(
        sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(
      String userEmail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(
        sharedPreferenceUserEmailKey, userEmail);
  }

  // getting data from SharedPreference
  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sharedPreferenceUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sharedPreferenceUserEmailKey);
  }
}
