import 'package:dio/dio.dart';
import 'package:task_test/src/core/consts/endpoints.dart';

class DioService {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
