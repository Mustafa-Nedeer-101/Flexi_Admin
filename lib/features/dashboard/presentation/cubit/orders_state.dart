part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;
  final List<double> weeklySales;

  OrdersSuccess({
    required this.orders,
    required this.weeklySales,
  });
}

final class OrdersFailure extends OrdersState {
  final Failure failure;

  OrdersFailure({required this.failure});
}
