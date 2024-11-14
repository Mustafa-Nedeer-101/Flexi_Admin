import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase {
  final AuthRepo repo;

  LoginUsecase({required this.repo});

  Future<Either<Failure, UserCredential>> call(LoginParams params) async {
    return await repo.login(params);
  }
}
