import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:admin/features/authentication/domain/entities/user_entity.dart';
import 'package:admin/features/authentication/domain/usecases/fetch_user_details_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'header_state.dart';

class HeaderCubit extends Cubit<HeaderState> {
  HeaderCubit() : super(HeaderLoading());

  initUserData() async {
    // Start Loading
    emit(HeaderLoading());

    // Fetch user data
    final userData =
        await FetchUserDetailsUsecase(repo: getIt<UserRepoImp>()).call();

    userData.fold((failure) {
      emit(HeaderFailure(failure: failure));
    }, (result) {
      emit(HeaderSuccess(user: result));
    });
  }
}
