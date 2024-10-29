import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepo {
  Either<Failure, bool> isAuthenticated();

  Future<Either<Failure, UserCredential>> login(LoginParams params);
}
