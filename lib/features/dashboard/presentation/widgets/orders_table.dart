import 'package:admin/core/common/shimmers/shimmer.dart';
import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/common/widgets/data_tables/paginated_data_table.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/dashboard/domain/entities/order_entity.dart';
import 'package:admin/features/dashboard/presentation/cubit/orders_cubit.dart';
import 'package:admin/features/dashboard/presentation/widgets/orders_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardOrders extends StatelessWidget {
  const DashboardOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          switch (state) {
            case OrdersLoading():
              return const Column(
                children: [
                  CustomShimmerEffect(
                      width: double.infinity, height: CSizes.buttonHeight),
                  SizedBox(height: CSizes.spaceBtwItems),
                  CustomShimmerEffect(
                      width: double.infinity, height: CSizes.buttonHeight),
                  SizedBox(height: CSizes.spaceBtwItems),
                  CustomShimmerEffect(
                      width: double.infinity, height: CSizes.buttonHeight),
                  SizedBox(height: CSizes.spaceBtwItems),
                  CustomShimmerEffect(
                      width: double.infinity, height: CSizes.buttonHeight),
                ],
              );
            case OrdersSuccess():
              return OrdersTable(orders: state.orders);
            case OrdersFailure():
              return Center(
                child: Text(state.failure.message),
              );
          }
        },
      ),
    );
  }
}

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable2(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: CSizes.xl * 1.2,
      columns: const [
        DataColumn2(label: Text("Order ID")),
        DataColumn2(label: Text("Date")),
        DataColumn2(label: Text("Items")),
        DataColumn2(label: Text("Status")),
        DataColumn2(label: Text("Amount")),
      ],
      source: OrdersRows(context: context, orders: orders),
    );
  }
}
