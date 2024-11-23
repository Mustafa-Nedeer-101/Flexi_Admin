import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/utils/device/device_utility.dart';
import 'package:admin/core/utils/helpers/helper_functions.dart';
import 'package:admin/features/dashboard/presentation/cubit/orders_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBarGraph extends StatelessWidget {
  const DashboardBarGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          switch (state) {
            case OrdersLoading():
              return const Center(child: CircularProgressIndicator());
            case OrdersSuccess():
              int interval = ((UHelperFunctions.maxOfDouble(state.weeklySales) /
                      6) as double)
                  .ceil();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weekly Sales",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),

                  // Graph
                  SizedBox(
                    height: 300,
                    child: BarChart(
                      // data
                      BarChartData(
                        titlesData: buildFlTitleData(interval.toDouble()),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: true,
                          drawVerticalLine: false,
                          horizontalInterval: interval.toDouble(),
                        ),
                        barGroups: state.weeklySales
                            .asMap()
                            .entries
                            .map((entry) =>
                                BarChartGroupData(x: entry.key, barRods: [
                                  BarChartRodData(
                                      toY: entry.value,
                                      width: 30,
                                      color: CColors.primary,
                                      borderRadius:
                                          BorderRadius.circular(CSizes.sm))
                                ]))
                            .toList(),
                        groupsSpace: CSizes.spaceBtwItems,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipColor: (group) => CColors.secondary,
                          ),
                          touchCallback: UDeviceUtils.isDesktopScreen(context)
                              ? (barTouchEvent, barTouchResponse) {}
                              : null,
                        ),
                      ),
                    ),
                  )
                ],
              );
            case OrdersFailure():
              return Center(child: Text(state.failure.message));
          }
        },
      ),
    );
  }
}

FlTitlesData buildFlTitleData(double interval) {
  return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

            final index = value.toInt() % days.length;

            final day = days[index];

            return SideTitleWidget(
              axisSide: AxisSide.bottom,
              space: 0,
              child: Text(day),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles:
            SideTitles(showTitles: true, interval: interval, reservedSize: 50),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)));
}
