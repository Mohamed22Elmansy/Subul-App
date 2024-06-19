import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation/data/server/diohellper.dart';
import 'package:graduation/presentation/Screens/resetpass.dart';
import 'package:graduation/presentation/Widgets/Dialog.dart';

import '../../presentation/Screens/Home_Screen.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  String buttonLable = "تاكيـد";

  Widget confirmEmail(
      {required String email,
      required BuildContext context,
      required tokenController,
      required emailController,
      required newpasswordControler}) {
    buttonLable = "...جار التاكد";
    emit(ConfirmPasswordLooding());
    try {
      DioHelper.PostData(
        postdata: {
          "email": email,
        },
        url: 'https://subul.onrender.com/api/users/reset',
      ).then((value) {
        if (value != null) {
          buttonLable = "تاكيـد";
          emit(ConfirmPasswordSucsses());
          showDialog(
              context: context,
              builder: (ct) {
                return resetPasswordPage(
                  emailController: emailController,
                  newpasswordControler: newpasswordControler,
                  tokenController: tokenController,
                );
              }).then((value) {
            buttonLable = "تاكيـد";
          });
        } else {
          emit(ConfirmPasswordFaild());
          buttonLable = "تاكيـد";
          showDialog(
              context: context,
              builder: (ctx) {
                return ShowMyDialog(
                    contentText: "..بريدك غير صالح", fontSize: 30);
              });
        }
      });
    } catch (e) {
      return SizedBox();
    }
    return SizedBox();
  }

  void resetPassword(
      {required String token,
      required String email,
      required String newPassword,
      required BuildContext context}) {
    buttonLable = "...جار التاكد";
    emit(ResetPasswordLooding());
    try {
      DioHelper.PostData(postdata: {
        "token": token,
        "email": email,
        "password": newPassword,
      }, url: 'https://subul.onrender.com/api/users/reset/confirm')
          .then((value) {
        if (value != null) {
          emit(ResetPasswordSucsses());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          buttonLable = "تاكيـد";
          emit(ResetPasswordFaild());
        }
      });
    } catch (e) {
      return;
    }
  }
}
