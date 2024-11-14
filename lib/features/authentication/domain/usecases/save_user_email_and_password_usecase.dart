import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class SaveUserEmailAndPasswordUsecase {
  final UserRepo repo;

  SaveUserEmailAndPasswordUsecase({required this.repo});

  Future<Either<Failure, void>> call({required LoginParams params}) async {
    final saveRememberMe = await repo.saveRememberMe();

    if (saveRememberMe is Failure) {
      return saveRememberMe;
    }

    final saveEmailAndPassword = await repo.saveUserEmailAndPassword(params);

    if (saveEmailAndPassword is Failure) {}

    return const Right(null);
  }
}
