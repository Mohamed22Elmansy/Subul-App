import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/data/server/cacheHelper.dart';

import '../../../data/server/diohellper.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  bool? isLogin;
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
    } else {
      userName = "Guest";
      email = "Guest@Subul.com";
      emit(UserNotLogin());
    }
  }

  void logOut() {
    try {
      DioHelper.PostData(
          postdata: {}, url: "https://subul.onrender.com/api/users/logout");
      CacheHelper.cacheUserLogin(false).then((value) =>checkUser());
      emit(UserLogOut());
    } catch (e) {
      return;
    }
  }
}
