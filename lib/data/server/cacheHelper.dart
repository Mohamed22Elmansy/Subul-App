import 'dart:convert';

import 'package:graduation/data/models/charityProfileData.dart';
import 'package:graduation/data/models/profilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<void> cacheUserLogin(bool isLogin, String loginType) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("User_Login_State", isLogin);
    sharedPreferences.setString("LoginType", loginType);
  }

  static Future<bool> getLoginType() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final cacheUserLogin = sharedPreferences.getString("LoginType");
      if (cacheUserLogin == "charity") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> getcacheUserLogin() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final cacheUserLogin = sharedPreferences.getBool("User_Login_State");
      if (cacheUserLogin != null && cacheUserLogin == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<void> BookCase(
      List<Map<String, dynamic>> data, int sallary) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      String encodedData = jsonEncode(data);
      await sharedPreferences.setString("BoohedData", encodedData);
      await sharedPreferences.setInt("Sallary", sallary);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> StoreCases(List<Map<String, dynamic>> data) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      String encodedData = jsonEncode(data);
      await sharedPreferences.setString("cases", encodedData);
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Map<String, dynamic>>> GetCases() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      String? encodedData = sharedPreferences.getString('cases');
      if (encodedData != null) {
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(jsonDecode(encodedData));
        return data;
      }
      return [];
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<List<Map<String, dynamic>>> GetBookedCase() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      String? encodedData = sharedPreferences.getString('BoohedData');
      if (encodedData != null) {
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(jsonDecode(encodedData));
        return data;
      }
      return [];
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<int> GetTotalSallary() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      int? sallary = sharedPreferences.getInt("Sallary");
      if (sallary != null) {
        return sallary;
      }
    } catch (e) {
      print(e);
    }

    return 0;
  }

  static Future<void> storetype(String type) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("type", type);
  }

  static Future<String> getType() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      String? type = sharedPreferences.getString("type");
      if (type != null) {
        return type;
      } else {
        return "";
      }
    } catch (e) {
      print(e);
    }
    return "";
  }

  static Future<void> storeCharityData(
      CharityProfileData profileData, String password) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      sharedPreferences.setString("User First Name", profileData.charity!.name);
      sharedPreferences.setString("User Second Name", "");
      sharedPreferences.setString(
          "User Phone Number", profileData.charity!.contactInfo!.phone);
      sharedPreferences.setString("User Email", profileData.charity!.email);
      sharedPreferences.setBool(
          "Is Verified", profileData.charity!.emailVerification!.isVerified);
      sharedPreferences.setString("password", password);
      sharedPreferences.setString("User Location", "Cairo");
      sharedPreferences.setString("Token", profileData.token!);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> storeUserData(
      ProfileData profileData, String password) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(
          "User First Name", profileData.user!.name.firstName);
      await sharedPreferences.setString(
          "Token", profileData.token == null ? "" : profileData.token!);

      await sharedPreferences.setString(
          "User Second Name", profileData.user!.name.lastName);
      await sharedPreferences.setString(
          "User Phone Number", profileData.user!.phone);
      await sharedPreferences.setString(
          "User Location", profileData.user!.userLocation.governorate);

      await sharedPreferences.setString("User Email", profileData.user!.email);

      await sharedPreferences.setBool(
          "Is Verified", profileData.user!.emailVerification.isVerified);
      await sharedPreferences.setString("password", password);
    } catch (e) {
      print(e);
    }
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      Map<String, dynamic> userData = {
        "User First Name": sharedPreferences.getString("User First Name"),
        "User Second Name": sharedPreferences.getString("User Second Name"),
        "User Email": sharedPreferences.getString("User Email"),
        "Is Verified": sharedPreferences.getBool("Is Verified"),
        "password": sharedPreferences.getString("password"),
        "User Phone Number": sharedPreferences.getString("User Phone Number"),
        "User Location": sharedPreferences.getString("User Location"),
        "Token": sharedPreferences.getString("Token"),
      };
      return userData;
    } catch (e) {
      print(e);
    }
    return {};
  }
}
