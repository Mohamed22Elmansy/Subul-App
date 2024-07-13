import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/data/models/AllCases.dart';
import 'package:graduation/data/models/charityProfileData.dart';

import 'package:graduation/data/server/cacheHelper.dart';

import '../../../data/models/profilemodel.dart';
import '../../../data/server/diohellper.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  bool? isLogin = false;
  bool isVerified = false;
  String userName = "Guest";
  String phoneNumber = "000000000";
  static bool? loginType;
  String city = "Cairo";
  String? password;
  String email = "Guest@Subul.com";
  static String token = "";
  static List<dynamic>? casses;

  void checkUser() async {
   /* try {
      DioHelper.GetData(
        url: 'https://subul.onrender.com/api/charities/allCases?',
      ).then((value) async {
        if (value != null) {
          //AllCases allCases = AllCases.fromJson(value.data);
          // casses = allCases.cases;
          // await CacheHelper.StoreCases(value.data['cases']);
          // print(allCases.cases);
          // print("from here");
          // print(value.data['cases']);
        } else {
          print("Error Ocure");
        }
      });
    } catch (e) {
      print(e);
    }*/

    try {
      isLogin = await CacheHelper.getcacheUserLogin();
      loginType = await CacheHelper.getLoginType();
      // casses = await CacheHelper.GetCases();
      // print('casses');
      // print(casses);
      print(loginType);
      if (isLogin == true) {
        print("is login");
        emit(UserIsLogin());

        Map<String, dynamic> userData = await CacheHelper.getUserData();
        print("user Data");
        print(userData);

        userName =
            "${userData["User First Name"]} ${userData["User Second Name"]}";
        email = userData["User Email"];
        city = userData["User Location"];

        token = userData["Token"];
        print(token);

        isVerified = userData["Is Verified"];
        phoneNumber = userData["User Phone Number"];
        password = userData["password"];
        DioHelper.PostData(
                token: "",
                postdata: {
                  "email": email,
                  "password": password,
                },
                url: loginType!
                    ? 'https://subul.onrender.com/api/charities/auth'
                    : 'https://subul.onrender.com/api/users/auth')
            .then((value) {
          if (value != null) {
            if (loginType!) {
              print("charity");
              CacheHelper.cacheUserLogin(true, "charity");
              CharityProfileData data = CharityProfileData.fromJson(value.data);
              CacheHelper.storeCharityData(data, password!);
            } else {
              print("user");
              CacheHelper.cacheUserLogin(true, "user");

              ProfileData userData = ProfileData.fromjson(value.data);
              CacheHelper.storeUserData(userData, password!);
            }
          }
        });
      } else {
        print("not login");
        userName = "Guest";
        city = "UnKnown";
        token = "";

        phoneNumber = "00000000";
        password = "";
        email = "Guest@Subul.com";
        isVerified = false;
        emit(UserNotLogin());
      }
    } catch (e) {
      print(e);
    }
  }

  void verifyAccount(
      {required String token,
      required String url,
      required BuildContext context}) {
    try {
      print(token);
      DioHelper.PostData(
              token: UserProfileCubit.token,
              postdata: {"token": token},
              url: url)
          .then((value) {
        if (value != null) {
          checkUser();
          emit(UserVerifyAccount());
        }
      });
    } catch (e) {
      return;
    }
  }

  void logOut({required String url}) {
    try {
      DioHelper.PostData(token: "", postdata: {}, url: url);
      CacheHelper.cacheUserLogin(false, "user").then((value) => checkUser());
      emit(UserLogOut());
    } catch (e) {
      return;
    }
  }
}
