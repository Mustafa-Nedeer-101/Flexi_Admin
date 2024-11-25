import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/authentication/domain/repositories/auth_repo.dart';
import 'package:admin/features/authentication/domain/usecases/auth_user_usecase.dart';
import 'package:admin/features/dashboard/data/repositories/orders_repo.dart';
import 'package:admin/features/dashboard/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';

class GetOrdersUsecase {
  final OrdersRepo ordersRepo;
  final AuthRepo authRepo;

  GetOrdersUsecase({required this.ordersRepo, required this.authRepo});

  Future<Either<Failure, List<OrderEntity>>> call() async {
    String userId = '';

    // Call auth usecase to get userId
    final authResult = AuthUserUsecase(repo: authRepo).call();

    authResult.fold((failure) {
      // Handle failure
      return failure;
    }, (userAuth) async {
      userId = userAuth.uid;
    });

    return await ordersRepo.getUserOrders(userId: userId);
  }
}
