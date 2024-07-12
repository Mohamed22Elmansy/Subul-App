import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:graduation/data/server/diohellper.dart';
import 'package:graduation/presentation/Screens/NavBarScreen.dart';
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
      required url,
      required newpasswordControler}) {
    buttonLable = "...جار التاكد";
    emit(ConfirmPasswordLooding());
    try {
      DioHelper.PostData(
        token: UserProfileCubit.token,
        postdata: {
          "email": email,
        },
        url: url,
      ).then((value) {
        if (value != null) {
          buttonLable = "تاكيـد";
          emit(ConfirmPasswordSucsses());
          showDialog(
              context: context,
              builder: (ct) {
                return resetPasswordPage(
                  myUrl: url,
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
      required String url,
      required String newPassword,
      required BuildContext context}) {
    buttonLable = "...جار التاكد";
    emit(ResetPasswordLooding());
    try {
      DioHelper.PostData(postdata: {
        "token": token,
        "email": email,
        "password": newPassword,

      },
      token: UserProfileCubit.token, url: url)
          .then((value) {
        if (value != null) {
          emit(ResetPasswordSucsses());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => NavBarScreen(),
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
