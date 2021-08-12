import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  final baseUrl = "http://localhost:5000/api/";

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ),
    );

    initializeInterceptors();
  }

  Future patchRequest(String endPoint, dynamic data) async {
    Response response;
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

  Future postRequest(String endPoint, dynamic data) async {
    Response response;
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

  Future deleteRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.delete(endPoint);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response.data;
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get<String>(
        endPoint,
        // Для работы Dio нужен включённый CORS на сервере с API
        // options: Options(headers: {
        //   'Access-Control-Allow-Origin': '*',
        //   'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, PATCH, DELETE',
        //   'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
        //   'Access-Control-Allow-Credentials': true
        // }),
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> getInitialWithParam(
    String endPoint,
    int take,
  ) async {
    Response response;
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

  Future<Response> getRequestWithParam({
    required String endPoint,
    required int skip,
    required int take,
    String? searchQuery,
  }) async {
    Response response;
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

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('RESPONSE[${response.statusCode}]');
        return handler.next(response);
      },
      onError: (err, handler) {
        print('ERROR[${err.response?.statusCode}]');
        return handler.next(err);
      },
    ));
  }
}
