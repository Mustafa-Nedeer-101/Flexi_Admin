import 'package:admin/features/template/cubit/sidebar_cubit.dart';
import 'package:admin/features/template/layouts/sidebar/side_bar_menu.dart';
import 'package:admin/features/template/layouts/sidebar/sidebar_logo.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class CustomSidebarLayout extends StatelessWidget {
  const CustomSidebarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SidebarCubit(),
      child: Drawer(
        shape: const BeveledRectangleBorder(),
        child: Container(
            decoration: const BoxDecoration(
                color: CColors.white,
                border: Border(right: BorderSide(color: CColors.grey))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomSidebarLogo(),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.all(CSizes.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Menu',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(letterSpacingDelta: 1.2)),
                        const SizedBox(height: CSizes.spaceBtwItems / 2),
                        const CustomSidebarMenu(
                            icon: Iconsax.status,
                            itemName: 'Dashboard',
                            route: 'Dashboard'),
                        const SizedBox(height: CSizes.spaceBtwItems / 2),
                        const CustomSidebarMenu(
                            icon: Iconsax.image,
                            itemName: 'Products',
                            route: 'Products'),
                        const SizedBox(height: CSizes.spaceBtwItems / 2),
                        const CustomSidebarMenu(
                            icon: Iconsax.picture_frame,
                            itemName: 'Categories',
                            route: 'Categories'),
                        const SizedBox(height: CSizes.spaceBtwItems / 2),
                        const CustomSidebarMenu(
                            icon: Iconsax.activity,
                            itemName: 'Images',
                            route: 'Images'),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
