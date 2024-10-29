import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class IsRememberMeUsecase {
  final UserRepo repo;

  IsRememberMeUsecase({required this.repo});

  Future<Either<Failure, bool>> call() async {
    return await repo.isRememberMe();
  }
}
