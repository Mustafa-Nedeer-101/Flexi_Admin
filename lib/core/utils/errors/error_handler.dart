import 'dart:async';
import 'dart:io';
import 'package:admin/core/utils/errors/exceptions.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ErrorHandler {
  static Failure exceptionToFailure(dynamic error) {
    if (error is SocketException) {
      return NetworkFailure(message: 'No internet connection');
    } else if (error is TimeoutException) {
      return TimeoutFailure(message: 'Request timed out');
    } else if (error is CacheException) {
      return CacheFailure(message: error.message);
    } else if (error is LogicException) {
      return LogicFailure(message: error.message);
    } else if (error is FirebaseAuthException) {
      return mapFirebaseAuthErrorToFailure(error);
    } else {
      return UnknownFailure(
          message: 'Unknown error occurred: ${error.toString()}');
    }
  }

  static Failure mapFirebaseAuthErrorToFailure(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return ValidationFailure(message: 'Invalid email address');
      case 'user-disabled':
        return ForbiddenFailure(message: 'User account is disabled');
      case 'user-not-found':
        return NotFoundFailure(message: 'User not found');
      case 'wrong-password':
        return UnauthorizedFailure(message: 'Incorrect password');
      case 'email-already-in-use':
        return ValidationFailure(message: 'Email is already in use');
      case 'operation-not-allowed':
        return ForbiddenFailure(message: 'Operation not allowed');
      case 'weak-password':
        return ValidationFailure(message: 'Password is too weak');
      case 'unknown-error':
      default:
        return UnknownFailure(
            message: 'An internal error has occurred: ${error.message}');
    }
  }
}
