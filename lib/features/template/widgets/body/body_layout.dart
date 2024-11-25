import 'package:admin/core/constants/sections.dart';
import 'package:admin/features/dashboard/dashboard.dart';
import 'package:admin/features/dashboard/presentation/cubit/orders_cubit.dart';
import 'package:admin/features/products/presentation/layouts/products_desktop_layout.dart';
import 'package:admin/features/template/cubit/sidebar/sidebar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBodyLayout extends StatelessWidget {
  const CustomBodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarCubit, SidebarState>(
      builder: (context, state) {
        switch (state.activeRoute) {
          case CSections.dashboard:
            return BlocProvider(
              create: (context) => OrdersCubit(),
              child: const Dashboard(),
            );

          case CSections.products:
            return const ProductsDesktopLayout();

          default:
            return const SizedBox();
        }
      },
    );
  }
}
