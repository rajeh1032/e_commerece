import 'package:dio/dio.dart';
import 'package:e_commerece/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManger {
  final dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(ApiConstants.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Object? body}) {
    return dio.post(ApiConstants.baseUrl + endPoint,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> deleteData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Object? body}) {
    return dio.delete(ApiConstants.baseUrl + endPoint,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> updateData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Object? body}) {
    return dio.put(ApiConstants.baseUrl + endPoint,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }


   
}
