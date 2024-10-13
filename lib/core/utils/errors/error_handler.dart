import 'dart:async';
import 'dart:io';
import 'package:admin/core/utils/errors/exceptions.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ErrorHandler {
  static Failure exceptionToFailure(dynamic error) {
    if (error is DioException) {
      return mapDioErrorToFailure(error);
    } else if (error is http.ClientException) {
      return NetworkFailure(message: 'Http client error: ${error.message}');
    } else if (error is SocketException) {
      return NetworkFailure(message: 'No internet connection');
    } else if (error is TimeoutException) {
      return TimeoutFailure(message: 'Request timed out');
    } else if (error is http.Response) {
      return mapHttpErrorToFailure(error.statusCode);
    } else if (error is CacheException) {
      return CacheFailure(message: error.message);
    } else if (error is LogicException) {
      return LogicFailure(message: error.message);
    } else {
      return UnknownFailure(
          message: 'Unknown error occurred: ${error.toString()}');
    }
  }

  static Failure mapDioErrorToFailure(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        return mapHttpErrorToFailure(error.response?.statusCode);
      case DioExceptionType.cancel:
        return NetworkFailure(message: 'Request was cancelled');
      case DioExceptionType.unknown:
        return NetworkFailure(message: 'Network error occurred');
      default:
        return UnknownFailure(message: 'Unknown Dio error');
    }
  }

  static Failure mapHttpErrorToFailure(int? statusCode) {
    if (statusCode == null) {
      return UnknownFailure(message: 'Unknown server error');
    }
    switch (statusCode) {
      case 400:
        return ValidationFailure(message: 'Bad request');
      case 401:
        return UnauthorizedFailure(message: 'Unauthorized access');
      case 403:
        return ForbiddenFailure(message: 'Forbidden');
      case 404:
        return NotFoundFailure(message: 'Resource not found');
      case 500:
        return ServerFailure(message: 'Internal server error');
      default:
        return ServerFailure(message: 'Server error: $statusCode');
    }
  }
}
