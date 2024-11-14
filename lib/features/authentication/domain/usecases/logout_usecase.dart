import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:admin/features/authentication/domain/repositories/auth_repo.dart';
import 'package:admin/features/authentication/domain/usecases/delete_emai_and_password_usecase.dart';
import 'package:dartz/dartz.dart';

class LogoutUsecase {
  final AuthRepo repo;

  LogoutUsecase({required this.repo});

  Future<Either<Failure, void>> call() async {
    final deleteEmailAndPassword =
        await DeleteEmaiAndPasswordUsecase(repo: getIt<UserRepoImp>()).call();

    if (deleteEmailAndPassword is Failure) return deleteEmailAndPassword;

    return await repo.logout();
  }
}
