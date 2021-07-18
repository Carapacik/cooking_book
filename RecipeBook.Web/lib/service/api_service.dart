import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  final baseUrl = "https://localhost:5001/api/";

  ApiService() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));

    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
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
