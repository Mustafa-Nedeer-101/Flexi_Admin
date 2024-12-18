import 'package:admin/core/utils/device/device_utility.dart';
import 'package:admin/features/dashboard/presentation/cubit/orders_cubit.dart';
import 'package:admin/features/dashboard/presentation/layouts/desktop_dashboard_layout.dart';
import 'package:admin/features/dashboard/presentation/layouts/mobile_dashboard_layout.dart';
import 'package:admin/features/dashboard/presentation/layouts/tablet_dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Call to get orders
    context.read<OrdersCubit>().getOrders();

    if (UDeviceUtils.isDesktopScreen(context)) {
      return const DesktopDashboardLayout();
    } else if (UDeviceUtils.isTabletScreen(context)) {
      return const TabletDashboardLayout();
    } else {
      return const MobileDashboardLayout();
    }
  }
}
