import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/features/authentication/data/repositories/auth_repo.dart';
import 'package:admin/features/authentication/domain/usecases/is_authenticated_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'redirct_state.dart';

class RedirectCubit extends Cubit<RedirectState> {
  RedirectCubit() : super(RedirectInitial());

  redirect() {
    final result = IsAuthenticatedUsecase(repo: getIt<AuthRepoImp>()).call();

    result.fold((failure) {
      emit(RedirectFailure());
    }, (right) {
      if (right) {
        emit(RedirectAuthenticated());
      } else {
        emit(RedirectUnauthenticated());
      }
    });
  }
}
