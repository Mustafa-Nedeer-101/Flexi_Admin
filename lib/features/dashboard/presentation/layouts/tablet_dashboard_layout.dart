import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/dashboard/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class TabletDashboardLayout extends StatelessWidget {
  const TabletDashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text("Dashboard", style: Theme.of(context).textTheme.headlineLarge),

            const SizedBox(height: CSizes.spaceBtwSections),

            // Cards
            const Row(
              children: [
                Expanded(
                  child: CustomDashboardCard(
                      title: "Sales total", subTitle: "\$265.0", status: 25),
                ),
                SizedBox(width: CSizes.spaceBtwItems),
                Expanded(
                  child: CustomDashboardCard(
                      title: "Average order value",
                      subTitle: "\$25.0",
                      status: 15),
                ),
              ],
            ),

            const SizedBox(height: CSizes.spaceBtwItems),

            const Row(
              children: [
                Expanded(
                  child: CustomDashboardCard(
                      title: "Total orders", subTitle: "\$134.0", status: 44),
                ),
                SizedBox(width: CSizes.spaceBtwItems),
                Expanded(
                  child: CustomDashboardCard(
                      title: "Visitors", subTitle: "\$90.0", status: 245),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
