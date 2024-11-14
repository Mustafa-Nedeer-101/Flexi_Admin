import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/repositories/auth_repo.dart';
import 'package:admin/features/authentication/domain/entities/user_entity.dart';
import 'package:admin/features/authentication/domain/repositories/user_repo.dart';
import 'package:admin/features/authentication/domain/usecases/auth_user_usecase.dart';
import 'package:dartz/dartz.dart';

class FetchUserDetailsUsecase {
  final UserRepo repo;

  FetchUserDetailsUsecase({required this.repo});

  Future<Either<Failure, UserEntity>> call() async {
    String userId = '';

    // Call Auth repo
    final authUser = AuthUserUsecase(repo: getIt<AuthRepoImp>()).call();

    authUser.fold((failure) {
      // Handle failure from auth user
    }, (result) {
      userId = result.uid;
    });

    return await repo.fetchUser(userId);
  }
}
