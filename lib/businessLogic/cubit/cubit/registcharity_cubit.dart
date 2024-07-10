import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/server/diohellper.dart';
import '../../../presentation/Screens/NavBarScreen.dart';
import '../../../presentation/Widgets/Dialog.dart';
import 'pick_image_cubit.dart';

part 'registcharity_state.dart';

class RegistcharityCubit extends Cubit<RegistcharityState> {
  RegistcharityCubit() : super(RegistcharityInitial());
  DateTime? selectedDate;
  String buttonLable = "إنشاء حساب";

  Future<void> selectDate(BuildContext context) async {
    emit(RegistcharitySelsctingData());
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    } else {
      selectedDate = DateTime.now();
    }
    emit(RegistcharityDataSelected());
  }

  void regist({
    required String name,
    required String password,
    required String email,
    required String website,
    required String phone,
    required String describtion,
    required String registeredNumber,
    required String establishedDate,
    required String charityLocation,
    required BuildContext context,
    required String contantLable,
    required double fontSize,
  }) {
    buttonLable = "...جار الأنشاء";
    emit(RegistcharityRegisting());
    try {
      DioHelper.PostData(
        url: 'https://subul.onrender.com/api/charities/register',
        postdata: {
          "name": name,
          "description": describtion,
          "charityInfo": {
            "registeredNumber": registeredNumber,
            "establishedDate": establishedDate,
          },
          "email": email,
          //"image": BlocProvider.of<PickImageCubit>(context).photo,
          "password": password,
          "phone": phone,
          "contactInfo": {
            "email": email,
            "phone": phone,
            "websiteUrl": website,
          },
          "charityLocation": {"governorate": charityLocation},
        },
      ).then((value) {
        if (value != null) {
          emit(RegistcharitySuccess());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => NavBarScreen(),
            ),
          );
        } else {
          buttonLable = "إنشاء حساب";
          emit(RegistcharityFailed());
          showDialog(
              context: context,
              builder: (ctx) =>
                  ShowMyDialog(contentText: contantLable, fontSize: fontSize));
        }
      });
    } catch (e) {
      return;
    }
  }
}
