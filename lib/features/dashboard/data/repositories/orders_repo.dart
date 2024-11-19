import 'package:admin/core/utils/errors/error_handler.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/features/dashboard/data/datasources/orders_remote_datasource.dart';
import 'package:admin/features/dashboard/data/models/order_model.dart';
import 'package:admin/features/dashboard/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getUserOrders({String? userId});
}

class OrdersRepoImp implements OrdersRepo {
  final OrdersRemoteDatasource remoteDatasource;

  OrdersRepoImp({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<OrderModel>>> getUserOrders(
      {String? userId}) async {
    try {
      final orders = await remoteDatasource.getUserOrders(userId: userId);

      return Right(orders);
    } catch (e) {
      return Left(ErrorHandler.exceptionToFailure(e));
    }
  }
}
