import 'package:dio/dio.dart';
import '../models/api_response.dart';

/// Simple API service for HTTP requests
class ApiService {
  final Dio _dio;
  static const String baseUrl = 'https://api.example.com';

  ApiService() : _dio = Dio() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token if available
          handler.next(options);
        },
        onError: (error, handler) {
          print('API Error: ${error.message}');
          handler.next(error);
        },
      ),
    );
  }

  /// GET request
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic json)? fromJson,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return ApiResponse.fromJson(response.data, fromJson);
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponse.error(message: 'Unexpected error: $e');
    }
  }

  /// POST request
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    T Function(dynamic json)? fromJson,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return ApiResponse.fromJson(response.data, fromJson);
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ApiResponse.error(message: 'Unexpected error: $e');
    }
  }

  /// Handle Dio errors
  ApiResponse<T> _handleError<T>(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiResponse.error(message: 'Kết nối quá thời gian', statusCode: 408);
      case DioExceptionType.sendTimeout:
        return ApiResponse.error(message: 'Gửi dữ liệu quá thời gian', statusCode: 408);
      case DioExceptionType.receiveTimeout:
        return ApiResponse.error(message: 'Nhận dữ liệu quá thời gian', statusCode: 408);
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 500;
        String message = 'Lỗi server';
        
        if (statusCode == 401) {
          message = 'Không có quyền truy cập';
        } else if (statusCode == 404) {
          message = 'Không tìm thấy dữ liệu';
        }

        return ApiResponse.error(message: message, statusCode: statusCode);
      case DioExceptionType.cancel:
        return ApiResponse.error(message: 'Yêu cầu đã bị hủy');
      case DioExceptionType.unknown:
        return ApiResponse.error(message: 'Lỗi kết nối mạng');
      default:
        return ApiResponse.error(message: 'Lỗi không xác định');
    }
  }
}