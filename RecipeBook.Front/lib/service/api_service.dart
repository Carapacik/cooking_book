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

  void dispose() {
    _dio.clear();
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

  Future<Response> getRequestWithParam(String endPoint, int? skip, int? take) async {
    Response response;
    try {
      response = await _dio.get<String>(
        endPoint,
        queryParameters: {'skip': skip, 'take': take},
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
