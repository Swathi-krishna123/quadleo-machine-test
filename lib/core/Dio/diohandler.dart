import 'package:dio/dio.dart';
import 'package:quadleo_machine_test/core/env/env.dart';

class DioHandler {
  static final DioHandler _instance = DioHandler._internal();
  factory DioHandler() => _instance;

  late final Dio _dio;

  DioHandler._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.apiUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  /// Generic GET method
  Future<dynamic> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      return Exception(
        e.response?.data['message'] ??
            'Something went wrong (${e.response?.statusCode})',
      );
    }
    return Exception(e.message ?? 'Network error');
  }
}
