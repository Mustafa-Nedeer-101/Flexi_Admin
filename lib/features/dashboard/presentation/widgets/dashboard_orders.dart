import 'package:admin/core/common/shimmers/shimmer.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/dashboard/presentation/cubit/orders_cubit.dart';
import 'package:admin/features/dashboard/presentation/widgets/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardOrders extends StatelessWidget {
  const DashboardOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        switch (state) {
          case OrdersLoading():
            return const Column(
              children: [
                CustomShimmerEffect(
                    width: double.infinity, height: CSizes.buttonHeight),
                SizedBox(height: CSizes.spaceBtwItems),

                //
                CustomShimmerEffect(
                    width: double.infinity, height: CSizes.buttonHeight),
                SizedBox(height: CSizes.spaceBtwItems),

                //
                CustomShimmerEffect(
                    width: double.infinity, height: CSizes.buttonHeight),
                SizedBox(height: CSizes.spaceBtwItems),

                //
                CustomShimmerEffect(
                    width: double.infinity, height: CSizes.buttonHeight),
              ],
            );
          case OrdersSuccess():
            return OrdersList(orders: state.orders);
          case OrdersFailure():
            return Center(
              child: Text(state.failure.message),
            );
        }
      },
    );
  }
}
