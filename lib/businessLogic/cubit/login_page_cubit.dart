import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/server/diohellper.dart';
import '../../presentation/Screens/Home_Screen.dart';
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
        url: url!,
        postdata: {"email": email, "password": password},
      ).then((value) {
        if (value != null) {
          emit(LoginPagesucsses());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
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
