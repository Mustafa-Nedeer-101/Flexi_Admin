import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/core/utils/errors/failure.dart';
import 'package:admin/core/utils/helpers/helper_functions.dart';
import 'package:admin/features/authentication/data/repositories/auth_repo.dart';
import 'package:admin/features/dashboard/data/repositories/orders_repo.dart';
import 'package:admin/features/dashboard/domain/entities/order_entity.dart';
import 'package:admin/features/dashboard/domain/usecases/get_orders_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersLoading());

  getOrders() async {
    // Call usecase
    final result = await GetOrdersUsecase(
            ordersRepo: getIt<OrdersRepoImp>(), authRepo: getIt<AuthRepoImp>())
        .call();

    result.fold((failure) {
      emit(OrdersFailure(failure: failure));
    }, (orders) {
      List<double> weeklySales = List.filled(7, 0.0);
      Map<OrderStatus, int> orderStatusData = <OrderStatus, int>{};
      Map<OrderStatus, double> totalAmounts = <OrderStatus, double>{};

      // Calculate Weekl Sales
      for (var order in orders) {
        final DateTime orderWeekStart =
            UHelperFunctions.getStartOfWeek(order.orderDate);

        if (orderWeekStart.isBefore(DateTime.now()) &&
            orderWeekStart
                .add(const Duration(days: 7))
                .isAfter(DateTime.now())) {
          int index = (order.orderDate.weekday - 1) % 7;

          // Ensure the index is non-negative
          index = index < 0 ? index + 7 : index;

          weeklySales[index] += order.totalAmount;
        }
      }

      // Calculate Order Status
      orderStatusData.clear();
      totalAmounts = {for (var status in OrderStatus.values) status: 0.0};
      for (var order in orders) {
        // Count Orders
        final status = order.status;
        orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;

        // Calculate total amounts for each status
        totalAmounts[status] = (totalAmounts[status] ?? 0) + 1;
      }

      // Emit Success
      emit(OrdersSuccess(
          orders: orders,
          weeklySales: weeklySales,
          orderStatusData: orderStatusData,
          totalAmounts: totalAmounts));
    });
  }
}
