import 'package:dio/dio.dart';

class MobileApiDio {
  static late MobileApiDio _instance;
  late Dio _http;

  static get instance {
    _instance = MobileApiDio._internal();
    return _instance;
  }

  MobileApiDio._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status != null && status < 500;
      },
    );

    _http = Dio(options);
    
    // Добавляем логирование запросов
    _http.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  factory MobileApiDio() => MobileApiDio._internal();

  get client => _http;

  dispose() {
    _http.close();
  }
}
