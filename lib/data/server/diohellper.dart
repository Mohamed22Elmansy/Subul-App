import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
      ),
    );
  }

  static Future<Response?> PostData({
    required Map<String, dynamic> postdata,
    required String url,
  }) async {
    try {
      return await dio?.post(url, data: postdata);
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: non_constant_identifier_names
  static Future<Response?> GetData({
    required String url,
  }) async {
    try {
      Response response = await dio!.get(url);
      print(response.data.toString());
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
