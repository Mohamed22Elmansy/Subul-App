import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:http_parser/http_parser.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:graduation/businessLogic/cubit/cubit/pick_image_cubit.dart';
import 'package:graduation/businessLogic/cubit/cubit/tabra_cubit.dart';
import 'package:graduation/data/server/diohellper.dart';

part 'add_case_state.dart';

class AddCaseCubit extends Cubit<AddCaseState> {
  AddCaseCubit() : super(AddCaseInitial());

  String buttonLable = " اضافه الان";
  void AddCase({
    required String title,
    required String description,
    required String gender,
    required String location,
    required BuildContext context,
  }) async {
    buttonLable = "...جار الاضافه";
    emit(AddCaseAdding());

    String type;
    if (BlocProvider.of<TabraCubit>(context).tabraType == TabraType.Kafarat) {
      type = "kafarat";
    } else if (BlocProvider.of<TabraCubit>(context).tabraType ==
        TabraType.Adahi) {
      type = "Adahi";
    } else {
      type = "Sadaqa";
    }

    try {
      DioHelper.PostDataWithImage(
        token: UserProfileCubit.token,
        postdata: FormData.fromMap({
          "title": title,
          "description": description,
          "mainType": type,
          "subType": "Foqaraa",
          "caseLocation": {
            "0": {"governorate": location}
          },
          "image": await MultipartFile.fromFile(
              contentType: MediaType("image", "png"),
              BlocProvider.of<PickImageCubit>(context).image!.path,
              filename: BlocProvider.of<PickImageCubit>(context).fileName),
          "gender": gender,
          "helpedNumbers": "5",
          "targetDonationAmount": "7",
        }),
        url: 'https://subul.onrender.com/api/charities/addCase',
      ).then((val) {
        if (val != null) {
          buttonLable = " اضافه الان";
          emit(AddCaseSuccess());
          print("Success");
        } else {
          buttonLable = " اضافه الان";
          emit(AddCaseFailed());
          print("Failed");
        }
      });
    } catch (e) {
      buttonLable = " اضافه الان";
      emit(AddCaseFailed());
      return;
    }
  }
}
