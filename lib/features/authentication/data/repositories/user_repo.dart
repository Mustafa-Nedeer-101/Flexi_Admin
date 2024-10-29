import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/error_handler.dart';
import 'package:admin/core/utils/errors/exceptions.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/datasources/user_local_datasource.dart';
import 'package:dartz/dartz.dart';

abstract interface class UserRepo {
  Future<Either<Failure, void>> saveUserEmailAndPassword(LoginParams params);
  Future<Either<Failure, LoginParams>> getUserEmailAndPassword();
  Future<Either<Failure, void>> deleteUserAndEmail();

  Future<Either<Failure, void>> saveRememberMe();
  Future<Either<Failure, bool>> isRememberMe();
  Future<Either<Failure, void>> deleteRememberMe();
}

class UserRepoImp implements UserRepo {
  final UserLocalDatasource localDatasource;

  UserRepoImp({required this.localDatasource});

  @override
  Future<Either<Failure, void>> deleteRememberMe() async {
    try {
      final result = await localDatasource.deleteRememberMe();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserAndEmail() async {
    try {
      final result = await localDatasource.deleteUserAndEmail();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, LoginParams>> getUserEmailAndPassword() async {
    try {
      final result = await localDatasource.getUserEmailAndPassword();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isRememberMe() async {
    try {
      final result = await localDatasource.isRememberMe();

      return Right(result);
    } on CacheException {
      return const Right(false);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> saveRememberMe() async {
    try {
      final result = await localDatasource.saveRememberMe();

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> saveUserEmailAndPassword(
      LoginParams params) async {
    try {
      final result = await localDatasource.saveUserEmailAndPassword(params);

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }
}
