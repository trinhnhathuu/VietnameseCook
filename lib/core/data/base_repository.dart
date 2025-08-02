import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class BaseRepository {
  // Helper method to handle API calls and convert exceptions to failures
  Future<Either<Failure, T>> handleApiCall<T>(
    Future<T> Function() apiCall,
  ) async {
    try {
      final result = await apiCall();
      return Right(result);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  Failure _mapExceptionToFailure(dynamic exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else if (exception is ValidationException) {
      return ValidationFailure(exception.message);
    } else {
      return UnknownFailure('Đã có lỗi không xác định xảy ra');
    }
  }
}

// Import the exceptions
class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
}

class CacheException implements Exception {
  final String message;
  const CacheException(this.message);
}

class ValidationException implements Exception {
  final String message;
  const ValidationException(this.message);
} 