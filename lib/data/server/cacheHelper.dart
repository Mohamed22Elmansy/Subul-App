import 'dart:convert';

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

  static Future<void> BookCase(
      List<Map<String, dynamic>> data, int sallary) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String encodedData = jsonEncode(data);
    await sharedPreferences.setString("BoohedData", encodedData);
    await sharedPreferences.setInt("Sallary", sallary);
  }

  static Future<List<Map<String, dynamic>>> GetBookedCase() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? encodedData = sharedPreferences.getString('BoohedData');
    if (encodedData != null) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(encodedData));
      return data;
    }
    return [];
  }

  static Future<int> GetTotalSallary() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    int? sallary = sharedPreferences.getInt("Sallary");
    if (sallary != null) {
      return sallary;
    }
    return 0;
  }

  static Future<void> storeUserData(
      ProfileData profileData, String password) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "User First Name", profileData.user!.name.firstName);
    sharedPreferences.setString(
        "User Second Name", profileData.user!.name.lastName);
    sharedPreferences.setString("User Phone Number", profileData.user!.phone);
    sharedPreferences.setString(
        "User Location", profileData.user!.userLocation.governorate);

    sharedPreferences.setString("User Email", profileData.user!.email);
    sharedPreferences.setBool(
        "Is Verified", profileData.user!.emailVerification.isVerified);
    sharedPreferences.setString("password", password);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userData = {
      "User First Name": sharedPreferences.getString("User First Name"),
      "User Second Name": sharedPreferences.getString("User Second Name"),
      "User Email": sharedPreferences.getString("User Email"),
      "Is Verified": sharedPreferences.getBool("Is Verified"),
      "password": sharedPreferences.getString("password"),
      "User Phone Number": sharedPreferences.getString("User Phone Number"),
      "User Location": sharedPreferences.getString("User Location"),
    };
    return userData;
  }
}
