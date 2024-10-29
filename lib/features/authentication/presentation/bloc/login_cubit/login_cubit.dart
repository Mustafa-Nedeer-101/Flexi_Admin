import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/features/authentication/data/repositories/auth_repo.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:admin/features/authentication/domain/usecases/delete_emai_and_password_usecase.dart';
import 'package:admin/features/authentication/domain/usecases/get_user_email_and_password_usecase.dart';
import 'package:admin/features/authentication/domain/usecases/is_remember_me_usecase.dart';
import 'package:admin/features/authentication/domain/usecases/login_usecase.dart';
import 'package:admin/features/authentication/domain/usecases/save_user_email_and_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool rememberMe = false;
  String email = '';
  String password = '';

  Future<LoginParams> init() async {
    // Check
    final isRememberme =
        await IsRememberMeUsecase(repo: getIt<UserRepoImp>()).call();

    // Get
    await isRememberme.fold((failure) {
      /// Handle failure returned from RememberMe
    }, (result) async {
      if (result) {
        // email and password
        final emailAndPassword =
            await GetUserEmailAndPasswordUsecase(repo: getIt<UserRepoImp>())
                .call();

        emailAndPassword.fold((failure) {
          // Handle failure returned from email and password
        }, (result) {
          // valid email and password returned
          if (result.email.isNotEmpty && result.password.isNotEmpty) {
            print('From Cubit: ${result.email} + ${result.password}');
            rememberMe = true;
            email = result.email;
            password = result.password;
          }
        });
      }
    });

    // Return
    return LoginParams(email: email, password: password);
  }

  login({required LoginParams params}) async {
    // Loading
    emit(LoginLoading());

    // Login
    final credentials =
        await LoginUsecase(repo: getIt<AuthRepoImp>()).call(params);

    credentials.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (result) async {
      if (rememberMe) {
        print("Trying to call Save usecase...");
        print("IsRememberMe: $rememberMe");
        final saveEamilAndPassword =
            await SaveUserEmailAndPasswordUsecase(repo: getIt<UserRepoImp>())
                .call(params: params);

        saveEamilAndPassword.fold((failure) {
          // Handle failure returned from save email and password
        }, (result) {
          // Handle Success returned from save email and password
        });
      } else {
        print("Trying to call Delete usecase...");
        print("IsRememberMe: $rememberMe");
        final deleteEmailAndPassword =
            await DeleteEmaiAndPasswordUsecase(repo: getIt<UserRepoImp>())
                .call();

        deleteEmailAndPassword.fold((failure) {
          // Handle failure returned from save email and password
          print('Delete Email and password failure!');
        }, (result) {
          // Handle Success returned from save email and password
          print('Delete Email and password success!');
        });
      }

      emit(LoginSuccess());
    });
  }
}
