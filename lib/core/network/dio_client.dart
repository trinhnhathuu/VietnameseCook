import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_strings.dart';
import '../error/exceptions.dart';
import 'api_endpoints.dart';

class DioClient {
  late final Dio _dio;
  
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    
    _dio.interceptors.add(_LoggingInterceptor());
    _dio.interceptors.add(_ErrorInterceptor());
  }
  
  Dio get dio => _dio;
  
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
  
  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}

class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print('DATA: ${options.data}');
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    print('DATA: ${response.data}');
    super.onResponse(response, handler);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    print('MESSAGE: ${err.message}');
    super.onError(err, handler);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const NetworkException(AppStrings.noInternetConnection);
      
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw const ValidationException('Dữ liệu không hợp lệ');
          case 401:
            throw const ServerException('Không có quyền truy cập');
          case 403:
            throw const ServerException('Bị cấm truy cập');
          case 404:
            throw const ServerException('Không tìm thấy dữ liệu');
          case 500:
            throw const ServerException(AppStrings.serverError);
          default:
            throw const ServerException(AppStrings.unknownError);
        }
      
      case DioExceptionType.cancel:
        throw const ServerException('Yêu cầu đã bị hủy');
      
      case DioExceptionType.unknown:
        throw const NetworkException(AppStrings.noInternetConnection);
      
      default:
        throw const ServerException(AppStrings.unknownError);
    }
  }
}

// Provider
final dioProvider = Provider<DioClient>((ref) {
  return DioClient();
}); 