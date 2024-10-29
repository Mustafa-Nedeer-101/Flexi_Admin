import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class GetUserEmailAndPasswordUsecase {
  final UserRepo repo;

  GetUserEmailAndPasswordUsecase({required this.repo});

  Future<Either<Failure, LoginParams>> call() async {
    return await repo.getUserEmailAndPassword();
  }
}
