import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class UserRepo {
  Future<Either<Failure, void>> saveUserEmailAndPassword(LoginParams params);
  Future<Either<Failure, LoginParams>> getUserEmailAndPassword();
  Future<Either<Failure, void>> deleteUserAndEmail();

  Future<Either<Failure, void>> saveRememberMe();
  Future<Either<Failure, bool>> isRememberMe();
  Future<Either<Failure, void>> deleteRememberMe();

  Future<Either<Failure, void>> createUser(UserEntity user);
  Future<Either<Failure, UserEntity>> fetchUser(String id);
}
