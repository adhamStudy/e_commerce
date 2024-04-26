import 'dart:convert';

import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://phptrain.u4e.net/ecommerce_flutter/',
        receiveDataWhenStatusError: true,
        responseType: ResponseType.plain,
      ),
    );
  }

  static dynamic getResponse(
      String s, Map<String, dynamic> data) async {
    try {
      dio!.options.headers = {
        'Content-Type': 'application/json',
      };
      final response = await dio!.get(s, queryParameters: data);
      return jsonDecode(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ('Connection timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        throw ('Server error: ${e.response?.statusCode}');
      } else {
        throw ('An error occurred');
      }
    }
  }

  static postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      FormData formData = FormData.fromMap(data);
      Response response = await dio!.post(
        
        url,
        data: formData,
      );
      return jsonDecode(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ('Connection timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        throw ('Server error: ${e.response?.statusCode}');
      } else {
        throw ('An error occurred ${e.toString()}');
      }
    }
  }
}
