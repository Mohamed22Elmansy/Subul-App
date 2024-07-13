import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:graduation/presentation/Screens/NavBarScreen.dart';
import 'package:graduation/presentation/Widgets/Dialog.dart';
import '../../data/models/profilemodel.dart';
import '../../data/server/cacheHelper.dart';
import '../../data/server/diohellper.dart';
import 'cubit/user_profile_cubit.dart';

part 'regist_state.dart';

enum Gender { male, female }

class RegistCubit extends Cubit<RegistState> {
  RegistCubit() : super(RegistInitial());
  Gender? gender;
  String? userGender;
  String buttonLable = "إنشاء حساب";

  void selectGender(Gender? value) {
    gender = value;
    if (gender == Gender.male) {
      emit(RegistMale());
      userGender = "male";
    } else {
      emit(RegistFemale());
      userGender = "female";
    }
  }

  void regist({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required BuildContext context,
    required String contantLable,
    required double fontSize,
  }) {
    buttonLable = "...جار الأنشاء";
    emit(RegistLooding());
    try {
      DioHelper.PostData(
        token: "",
        url: 'https://subul.onrender.com/api/users',
        postdata: {
          "name": {
            "firstName": firstName,
            "lastName": lastName,
          },
          "email": email,
          "password": password,
          "phone": phone,
          "gender": gender,
          "userLocation": {"governorate": "Cairo"}
        },
      ).then((value) {
        if (value != null) {
          try {
            
          emit(RegistSucsses());
          CacheHelper.cacheUserLogin(true, "user");

          ProfileData userData = ProfileData.fromjson(value.data);
          CacheHelper.storeUserData(userData, password).then((value) =>
              BlocProvider.of<UserProfileCubit>(context).checkUser());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => NavBarScreen(),
            ),
          );
          } catch (e) {
            print(e);
          }
        } else {
          buttonLable = "إنشاء حساب";
          emit(RegistFailuer());
          showDialog(
              context: context,
              builder: (ctx) =>
                  ShowMyDialog(contentText: contantLable, fontSize: fontSize));
        }
      }).onError(
        (error, stackTrace) {
          print(error);
          print(stackTrace.toString());
        },
      );
    } catch (e) {
      return;
    }
  }
}
