import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class SaveUserEmailAndPasswordUsecase {
  final UserRepo repo;

  SaveUserEmailAndPasswordUsecase({required this.repo});

  Future<Either<Failure, void>> call({required LoginParams params}) async {
    final saveRememberMe = await repo.saveRememberMe();

    if (saveRememberMe is Failure) {
      print('Failed to save remember me');
      return saveRememberMe;
    }

    final saveEmailAndPassword = await repo.saveUserEmailAndPassword(params);

    if (saveEmailAndPassword is Failure) {
      print('Failure from save email and password repo...');
    }

    return const Right(null);
  }
}
