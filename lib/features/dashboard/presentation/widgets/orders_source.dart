import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/utils/specific/helpers.dart';
import 'package:admin/features/dashboard/domain/entities/order_entity.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class OrdersRows extends DataTableSource {
  final BuildContext context;
  final List<OrderEntity> orders;

  OrdersRows({required this.context, required this.orders});

  @override
  DataRow? getRow(int index) {
    final order = orders[index];
    return DataRow2(cells: [
      DataCell(
        Text(
          order.id,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: CColors.primary),
        ),
      ),
      DataCell(
        Text(order.formattedOrderDate),
      ),
      DataCell(
        Text("${order.items.length}"),
      ),
      DataCell(
        CustomRoundedContainer(
          radius: CSizes.cardRadiusSm,
          padding: const EdgeInsets.symmetric(
              vertical: CSizes.xs, horizontal: CSizes.md),
          backgroundColor:
              SHelpers.getOrderStatusColor(order.status).withOpacity(0.1),
          child: Text(
            SHelpers.getDisplayStatusName(order.status),
            style: TextStyle(color: SHelpers.getOrderStatusColor(order.status)),
          ),
        ),
      ),
      DataCell(
        Text("\$${order.totalAmount}"),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
