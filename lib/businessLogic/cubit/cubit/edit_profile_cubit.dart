import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:graduation/data/server/diohellper.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  String buttonLable = "تعديل";
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? cityController = TextEditingController();

  void SetData(BuildContext context) {
    nameController!.text = BlocProvider.of<UserProfileCubit>(context).userName;
    emailController!.text = BlocProvider.of<UserProfileCubit>(context).email;
    phoneController!.text =
        BlocProvider.of<UserProfileCubit>(context).phoneNumber;
    cityController!.text = BlocProvider.of<UserProfileCubit>(context).city;
  }

  void EditProfile() {
    buttonLable = "...جار التعديل";
    emit(EditProfileLooding());
    final spilitted = nameController!.text.split(' ');
    try {
      DioHelper.PutData(
              token: UserProfileCubit.token,
              postdata: {
                "name": {
                  "firstName": spilitted[0],
                  "lastName": spilitted[1],
                },
                "phone": phoneController!.text,
                // "email": emailController!.text,
                "location": {
                  "governorate": cityController!.text,
                }
              },
              url: UserProfileCubit.loginType!
                  ? 'https://subul.onrender.com/api/charities/edit-profile'
                  : "https://subul.onrender.com/api/users/profile/edit")
          .then((val) async {
        if (val != null) {
          buttonLable = "تعديل";
          emit(EditProfileSuccess());
          final sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString("User First Name", nameController!.text);
          sharedPreferences.setString("User Second Name", "");
          sharedPreferences.setString(
              "User Phone Number", phoneController!.text);

          sharedPreferences.setString("User Email", emailController!.text);
        } else {
          emit(EditProfileFailed());
          buttonLable = "تعديل";
        }
      });
    } catch (e) {
      return;
    }
  }
}
