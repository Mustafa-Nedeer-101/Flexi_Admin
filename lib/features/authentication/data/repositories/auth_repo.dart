import 'dart:io';
import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/error_handler.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/core/utils/managers/network_manager.dart';
import 'package:admin/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:admin/features/authentication/data/models/auth_user_model.dart';
import 'package:admin/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImp implements AuthRepo {
  final AuthRemoteDatasource remoteDatasource;
  final NetworkManager networkManager;

  AuthRepoImp({required this.remoteDatasource, required this.networkManager});

  @override
  Either<Failure, bool> isAuthenticated() {
    try {
      return Right(remoteDatasource.isAuthenticated());
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Either<Failure, AuthUserModel> authUser() {
    try {
      return Right(remoteDatasource.authUser());
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> login(LoginParams params) async {
    try {
      final bool connected = await networkManager.isConnected();

      if (connected) {
        final response = await remoteDatasource.login(params);

        return Right(response);
      } else {
        return Left(ErrorHandler.exceptionToFailure(const SocketException('')));
      }
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await remoteDatasource.logout());
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }
}
