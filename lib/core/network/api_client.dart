import 'package:dio/dio.dart';

class ApiClient {
  ApiClient({String? baseUrl}) : dio = Dio(BaseOptions(
    baseUrl: baseUrl ?? const String.fromEnvironment('API_BASE_URL', defaultValue: 'http://localhost:3000/api'),
    connectTimeout: const Duration(seconds: 10), receiveTimeout: const Duration(seconds: 10),
    headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
  ));
  final Dio dio;
}
