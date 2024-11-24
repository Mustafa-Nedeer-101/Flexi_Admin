import 'package:admin/core/common/widgets/containers/circulat_container.dart';
import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/utils/specific/helpers.dart';
import 'package:admin/features/dashboard/presentation/cubit/orders_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPieChart extends StatelessWidget {
  const DashboardPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          switch (state) {
            case OrdersLoading():
              return const Center(child: CircularProgressIndicator());
            case OrdersSuccess():
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Orders Status",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: CSizes.spaceBtwSections),

                    // Graph
                    SizedBox(
                      height: 400,
                      child: PieChart(
                        // Data
                        PieChartData(
                          // Sections
                          sections: state.orderStatusData.entries.map((entry) {
                            final status = entry.key;
                            final count = entry.value;

                            return PieChartSectionData(
                              color: SHelpers.getOrderStatusColor(status),
                              radius: 100,
                              title: count.toString(),
                              value: count.toDouble(),
                              titleStyle: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            );
                          }).toList(),

                          // Touch
                          pieTouchData: PieTouchData(
                            enabled: true,
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {},
                          ),
                        ),
                      ),
                    ),

                    // Show Status and Color Meta
                    SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Orders')),
                          DataColumn(label: Text('Total')),
                        ],
                        rows: state.orderStatusData.entries.map((entry) {
                          final OrderStatus status = entry.key;
                          final int count = entry.value;
                          final totalAmount = state.totalAmounts[status] ?? 0;

                          return DataRow(cells: [
                            DataCell(Row(
                              children: [
                                CustomCircularContainer(
                                  width: 20,
                                  height: 20,
                                  backgroundColor:
                                      SHelpers.getOrderStatusColor(status),
                                ),
                                Expanded(
                                  child: Text(
                                    " ${SHelpers.getDisplayStatusName(status)}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )),
                            DataCell(Text(count.toString())),
                            DataCell(
                              Text('\$${totalAmount.toStringAsFixed(2)}'),
                            )
                          ]);
                        }).toList(),
                      ),
                    ),
                  ]);
            case OrdersFailure():
              return Center(child: Text(state.failure.message));
          }
        },
      ),
    );
  }
}
