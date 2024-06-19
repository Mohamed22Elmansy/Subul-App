import 'package:dio/dio.dart';
import 'package:graduation/data/models/profilemodel.dart';
import 'package:graduation/data/server/diohellper.dart';

class UsersRepository {
  Future GetUserData() async {
    final userData = await DioHelper.GetData(
        url: 'https://subul.onrender.com/api/users/profile');
    return ProfileData.fromjson(userData!.data);
  }
}
