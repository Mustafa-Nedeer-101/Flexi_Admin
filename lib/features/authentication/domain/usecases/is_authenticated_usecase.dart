import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';

class IsAuthenticatedUsecase {
  final AuthRepo repo;

  IsAuthenticatedUsecase({required this.repo});

  Either<Failure, bool> call() {
    return repo.isAuthenticated();
  }
}
