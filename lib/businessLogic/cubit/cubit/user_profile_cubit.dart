import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/login_page_cubit.dart';
import 'package:graduation/data/server/cacheHelper.dart';
import 'package:path/path.dart';

import '../../../data/models/profilemodel.dart';
import '../../../data/server/diohellper.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  bool? isLogin = false;
  bool isVerified = false;
  String userName = "Guest";
  String phoneNumber = "000000000";

  String city = "Cairo";
  String? password;
  String email = "Guest@Subul.com";

  void checkUser() async {
    isLogin = await CacheHelper.getcacheUserLogin();
    if (isLogin == true) {
      emit(UserIsLogin());

      Map<String, dynamic> userData = await CacheHelper.getUserData();
      userName =
          "${userData["User First Name"]} ${userData["User Second Name"]}";
      email = userData["User Email"];
      city = userData["User Location"];
      isVerified = userData["Is Verified"];
      phoneNumber = userData["User Phone Number"];
      password = userData["password"];
      DioHelper.PostData(postdata: {
        "email": email,
        "password": password,
      }, url: 'https://subul.onrender.com/api/users/auth')
          .then((value) {
        if (value != null) {
          CacheHelper.cacheUserLogin(true);

          ProfileData userData = ProfileData.fromjson(value.data);
          CacheHelper.storeUserData(userData, password!);
        }
      });
    } else {
      userName = "Guest";
      city = "UnKnown";
      phoneNumber = "00000000";
      password = "";
      email = "Guest@Subul.com";
      isVerified = false;
      emit(UserNotLogin());
    }
  }

  void verifyAccount({required String token}) {
    try {
      print(token);
      DioHelper.PostData(
              postdata: {"token": token},
              url: "https://subul.onrender.com/api/users/activate")
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

  void logOut(BuildContext context) {
    try {
      DioHelper.PostData(
          postdata: {}, url: "https://subul.onrender.com/api/users/logout");
      CacheHelper.cacheUserLogin(false).then((value) => checkUser());
      emit(UserLogOut());
    } catch (e) {
      return;
    }
  }
}
