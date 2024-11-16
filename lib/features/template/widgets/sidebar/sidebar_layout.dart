import 'package:admin/core/constants/sections.dart';
import 'package:admin/features/template/widgets/sidebar/menu.dart';
import 'package:admin/features/template/widgets/sidebar/logo.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawerLayout extends StatelessWidget {
  const CustomDrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
          decoration: const BoxDecoration(
            color: CColors.white,
            border: Border(right: BorderSide(color: CColors.grey)),
          ),
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
                          route: CSections.dashboard),
                      const SizedBox(height: CSizes.spaceBtwItems / 2),
                      const CustomSidebarMenu(
                          icon: Iconsax.image,
                          itemName: 'Products',
                          route: CSections.products),
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
    );
  }
}
