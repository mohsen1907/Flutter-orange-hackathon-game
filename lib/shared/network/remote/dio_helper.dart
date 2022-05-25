import 'package:dio/dio.dart';
import 'package:orangetask_mohamedmohsen/shared/components/constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: cApiUrl,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'Application/json',
          'Accept': 'Application/json'
        }));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      bool isAuthentication = false}) async {
    final res = await dio.get(url, queryParameters: query);
    res.statusCode;
    return res;
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      bool isAuthentication = false}) async {
    return dio.put(url,
        queryParameters: query, data: data, options: Options(headers: headers));
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers,
      dynamic data,
      bool isAuthentication = false}) async {
    return dio.post(url,
        queryParameters: query, data: data, options: Options(headers: headers));
  }

  static Future<Response> deleteData(
      {required String url,
      Map<String, dynamic>? query,
      dynamic data,
      bool isAuthentication = false}) async {
    return dio.delete(url, queryParameters: query, data: data);
  }
}
