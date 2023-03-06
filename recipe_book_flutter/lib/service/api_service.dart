import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    initializeInterceptors();
  }

  late Dio _dio;

  final baseUrl = 'http://localhost:5000/api/';

  Future<dynamic> patchRequest(String endPoint, Object data) async {
    Response<dynamic> response;
    try {
      response = await _dio.patch(
        endPoint,
        data: data,
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response.data;
  }

  Future<Response<dynamic>> postRequestWithoutData(String endPoint) async {
    Response<dynamic> response;
    try {
      response = await _dio.post(endPoint);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  Future<dynamic> postRequest(String endPoint, Object data) async {
    Response<dynamic> response;
    try {
      response = await _dio.post(
        endPoint,
        data: data,
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response.data;
  }

  Future<dynamic> deleteRequest(String endPoint) async {
    Response<dynamic> response;
    try {
      response = await _dio.delete(endPoint);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response.data;
  }

  Future<Response<dynamic>> getRequest(String endPoint) async {
    Response<dynamic> response;
    try {
      response = await _dio.get<String>(endPoint);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response<String>> getInitialWithParam(
    String endPoint,
    int take,
  ) async {
    Response<String> response;
    try {
      response = await _dio.get<String>(
        endPoint,
        queryParameters: {
          'take': take,
        },
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response<String>> getRequestWithParam({
    required String endPoint,
    required int skip,
    required int take,
    String? searchQuery,
  }) async {
    Response<String> response;
    try {
      response = await _dio.get<String>(
        endPoint,
        queryParameters: {
          'skip': skip,
          'take': take,
          'searchQuery': searchQuery,
        },
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  void initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print('REQUEST[${options.method}] => PATH: ${options.path}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print('RESPONSE[${response.statusCode}]');
          }
          return handler.next(response);
        },
        onError: (err, handler) {
          if (kDebugMode) {
            print('ERROR[${err.response?.statusCode}]');
          }
          return handler.next(err);
        },
      ),
    );
  }
}
