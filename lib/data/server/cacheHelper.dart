import 'package:graduation/data/models/profilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<void> cacheUserLogin(bool isLogin) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("User_Login_State", isLogin);
  }

  static Future<bool> getcacheUserLogin() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cacheUserLogin = sharedPreferences.getBool("User_Login_State");
    if (cacheUserLogin != null && cacheUserLogin == true) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> storeUserData(ProfileData profileData) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "User First Name", profileData.user!.name.firstName);
    sharedPreferences.setString(
        "User Second Name", profileData.user!.name.lastName);
    sharedPreferences.setString("User Email", profileData.user!.email);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userData = {
      "User First Name": sharedPreferences.getString("User First Name"),
      "User Second Name": sharedPreferences.getString("User Second Name"),
      "User Email": sharedPreferences.getString("User Email"),
    };
    return userData;
  }
}
