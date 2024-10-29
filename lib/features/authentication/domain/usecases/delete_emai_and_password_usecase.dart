import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteEmaiAndPasswordUsecase {
  final UserRepo repo;

  DeleteEmaiAndPasswordUsecase({required this.repo});

  Future<Either<Failure, void>> call() async {
    final deleteRememberMe = await repo.deleteRememberMe();

    if (deleteRememberMe is Failure) {
      print('Failed to delete remember me!');
      return deleteRememberMe;
    }

    final deleteEmailAndPassword = await repo.deleteUserAndEmail();

    if (deleteEmailAndPassword is Failure) {
      print('Failed to delete email and password!');
      return deleteEmailAndPassword;
    }

    return const Right(null);
  }
}
