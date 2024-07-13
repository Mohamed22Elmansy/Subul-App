import 'dart:math';

import 'package:dio/dio.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:graduation/data/server/cacheHelper.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
        /* headers: {
          'Cookie':
              'jwt=${UserProfileCubit.token}', // Add the JWT to the Cookie header
        },*/
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
      ),
    );
  }

  static Future<Response?> PostData({
    required Map<String, dynamic> postdata,
    required String url,
    required String token,
  }) async {
    try {
      return await dio?.post(
        url,
        data: postdata,
        options: Options(
          headers: {
            'Cookie':
                'jwt=${UserProfileCubit.token}', // Add the JWT to the Cookie header
          },
        ),
      );
    } on DioException catch (e) {
      String errorMessage = 'Unknown error';
      if (e.response != null) {
        errorMessage = 'Error: ${e.response!.statusCode} ${e.response!.data}';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      print(errorMessage);
    }
  }

  static Future<Response?> PutData({
    required Map<String, dynamic> postdata,
    required String url,
    required String token,
  }) async {
    try {
      print(UserProfileCubit.token);

      print(postdata.toString());
      return await dio?.put(url,
          data: postdata,
          options: Options(
            headers: {
              'Cookie':
                  'jwt=${UserProfileCubit.token}', // Add the JWT to the Cookie header
            },
          ));
    } on DioException catch (e) {
      String errorMessage = 'Unknown error';
      if (e.response != null) {
        errorMessage = 'Error: ${e.response!.statusCode} ${e.response!.data}';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      print(errorMessage);
    }
  }

  static Future<Response?> PostDataWithImage({
    required FormData postdata,
    required String url,
    required String token,
  }) async {
    try {
      print(UserProfileCubit.token);
      return await dio?.post(
        url,
        data: postdata,
        options: Options(
          headers: {
            'Cookie':
                'jwt=${UserProfileCubit.token}', // Add the JWT to the Cookie header
          },
        ),
      );
    } on DioException catch (e) {
      String errorMessage = 'Unknown error';
      if (e.response != null) {
        errorMessage = 'Error: ${e.response!.statusCode} ${e.response!.data}';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      print(errorMessage);
    }
  }

  // ignore: non_constant_identifier_names
  static Future<Response?> GetData({
    required String url,
  }) async {
    try {
      Response response = await dio!.get(
        url,
        options: Options(
          headers: {
            'Cookie':
                'jwt=${UserProfileCubit.token}', // Add the JWT to the Cookie header
          },
        ),
      );
      print(response.data.toString());
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
