import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/data/server/cacheHelper.dart';

import '../../../data/server/diohellper.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  bool? isLogin;
  bool isVerified = false;
  String userName = "Guest";
  String email = "Guest@Subul.com";

  void checkUser() async {
    isLogin = await CacheHelper.getcacheUserLogin();
    if (isLogin == true) {
      emit(UserIsLogin());
      Map<String, dynamic> userData = await CacheHelper.getUserData();
      userName =
          "${userData["User First Name"]} ${userData["User Second Name"]}";
      email = userData["User Email"];
      isVerified = userData["Is Verified"];
    } else {
      userName = "Guest";
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

  void logOut() {
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
