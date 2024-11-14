import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/domain/entities/auth_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepo {
  Either<Failure, bool> isAuthenticated();

  Either<Failure, AuthUserEntity> authUser();

  Future<Either<Failure, UserCredential>> login(LoginParams params);

  Future<Either<Failure, void>> logout();
}
