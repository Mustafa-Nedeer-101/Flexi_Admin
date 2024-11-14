import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/error_handler.dart';
import 'package:admin/core/utils/errors/exceptions.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/datasources/user_local_datasource.dart';
import 'package:admin/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:admin/features/authentication/data/models/user_model.dart';
import 'package:admin/features/authentication/domain/entities/user_entity.dart';
import 'package:admin/features/authentication/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class UserRepoImp implements UserRepo {
  final UserLocalDatasource localDatasource;
  final UserRemoteDatasource remoteDatasource;

  UserRepoImp({required this.localDatasource, required this.remoteDatasource});

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

  // Create a user record in database
  @override
  Future<Either<Failure, void>> createUser(UserEntity user) async {
    try {
      final model = UserModel.fromEntity(user);
      final result = await remoteDatasource.createUser(model);

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  // fetch a user record from database
  @override
  Future<Either<Failure, UserModel>> fetchUser(String id) async {
    try {
      final result = await remoteDatasource.fetchAdminDetails(id);

      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }
}
