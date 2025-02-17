import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:graduation/data/models/AllCases.dart';
import 'package:graduation/data/models/charityProfileData.dart';
import 'package:graduation/data/models/profilemodel.dart';
import 'package:graduation/data/server/cacheHelper.dart';
import 'package:graduation/presentation/Screens/NavBarScreen.dart';

import '../../data/server/diohellper.dart';

import '../../presentation/Widgets/Dialog.dart';

part 'login_page_state.dart';

enum Logintype { user, charity }

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageInitial());
  bool passVisible = false;
  Logintype? logintype;
  String buttonLable = "تسجيل الدخول";
  String? url;
  void changeVisiblity() {
    passVisible = !passVisible;

    if (passVisible == true) {
      emit(Passwordvisible());
    } else {
      emit(PasswordInvisible());
    }
  }

  void loginType(Logintype? value) {
    logintype = value;
    if (logintype == Logintype.user) {
      emit(LoginTypeUser());
    } else {
      emit(LoginTypeCharity());
    }
  }

  void Login(
      {required String email,
      required double fontSize,
      required String password,
      required String contantText,
      required BuildContext context}) async {
    buttonLable = "...جار التسجيل";
    emit(LoginPagelogining());

    try {
      if (logintype == Logintype.user) {
        url = 'https://subul.onrender.com/api/users/auth';
      } else {
        url = 'https://subul.onrender.com/api/charities/auth';
      }
      DioHelper.PostData(
        token: "",
        url: url!,
        postdata: {"email": email, "password": password},
      ).then((value) async {
        if (value != null) {
          emit(LoginPagesucsses());
          buttonLable = "تسجيل الدخول";

          if (logintype == Logintype.user) {
            try {
              await CacheHelper.cacheUserLogin(true, "user");

              ProfileData userData = ProfileData.fromjson(value.data);

              await CacheHelper.storeUserData(userData, password).then(
                  (value) =>
                      BlocProvider.of<UserProfileCubit>(context).checkUser());
            } catch (e) {
              print(e);
            }
          } else {
            try {
              await CacheHelper.cacheUserLogin(true, "charity");
              CharityProfileData userData =
                  CharityProfileData.fromJson(value.data);
              await CacheHelper.storeCharityData(userData, password).then(
                  (value) =>
                      BlocProvider.of<UserProfileCubit>(context).checkUser());
            } catch (e) {
              print(e);
            }
          }

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => NavBarScreen(),
            ),
          );
        } else {
          buttonLable = "تسجيل الدخول";
          emit(LoginPagefailure());
          showDialog(
              context: context,
              builder: (ctx) => ShowMyDialog(
                    contentText: contantText,
                    fontSize: fontSize,
                  ));
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
