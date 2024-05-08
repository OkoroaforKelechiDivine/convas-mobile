import 'package:dio/dio.dart';

import '../../../../di/locator.dart';
import 'api_failure.dart';
import 'endpoints.dart';
import 'logging_interceptor.dart';

class ApiService {
  ApiService({required this.path});

  final String path;

  Dio get _dio => Dio(
    BaseOptions(
      headers: {"Authorization": appGlobals.token == null ? null : 'Bearer ${appGlobals.token}'},
      baseUrl: Endpoints.baseUrl + path,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  )..interceptors.add(
    LoggingInterceptor(),
  );

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParams);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> delete(String path,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await _dio.delete(path, queryParameters: queryParams);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> post(String path, {Object? data}) async {
    try {
      final res = await _dio.post(path, data: data);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> put(String path, {Object? data}) async {
    try {
      final res = await _dio.put(path, data: data);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> patch(String path, {Object? data}) async {
    try {
      final res = await _dio.patch(path, data: data);
      return res.data;
    } on DioException catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  String _handleError(DioException dioError) {
    String errorDescription = "";
    //if (error is DioError) {
    //DioError dioError = error as DioError;

    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout. Please try again!";
        break;
      case DioExceptionType.unknown:
        errorDescription = "Something went wrong";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with server";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with server";
        break;
      case DioExceptionType.connectionError:
        errorDescription = "Connection to server failed due to internet";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "Bad certificate";
        break;
      case DioExceptionType.badResponse:
        errorDescription = "Bad response";
        if (dioError.response?.data['error'] != null) {
          errorDescription = dioError.response?.data['error'];
        }
        if (dioError.response?.data['message'] != null) {
          errorDescription = dioError.response?.data['message'];
        }
        break;
    }
    return errorDescription;
  }
}
