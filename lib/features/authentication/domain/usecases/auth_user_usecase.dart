import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/domain/entities/auth_user_entity.dart';
import 'package:admin/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthUserUsecase {
  final AuthRepo repo;

  AuthUserUsecase({required this.repo});

  Either<Failure, AuthUserEntity> call() {
    return repo.authUser();
  }
}
