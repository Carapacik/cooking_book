import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  final baseUrl = "https://localhost:5001/api/";

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));

    initializeInterceptors();
  }

  Future postRequest(String endPoint, dynamic object) async {
    Response response;
    try {
      response = await _dio.post(
        endPoint,
        data: object.toJson(),
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response.data;
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get<String>(endPoint);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      print(error.message);
      return handler.next(error);
    }, onRequest: (options, handler) {
      print("${options.method} ${options.path}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      print(response.data);
      return handler.next(response);
    }));
  }
}
