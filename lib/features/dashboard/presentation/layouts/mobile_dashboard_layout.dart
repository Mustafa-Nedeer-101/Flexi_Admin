import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/dashboard/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class MobileDashboardLayout extends StatelessWidget {
  const MobileDashboardLayout({super.key});

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
            const CustomDashboardCard(
                title: "Sales total", subTitle: "\$265.0", status: 25),
            const SizedBox(width: CSizes.spaceBtwItems),
            const CustomDashboardCard(
                title: "Average order value", subTitle: "\$25.0", status: 15),
            const SizedBox(width: CSizes.spaceBtwItems),
            const CustomDashboardCard(
                title: "Total orders", subTitle: "\$134.0", status: 44),
            const SizedBox(width: CSizes.spaceBtwItems),
            const CustomDashboardCard(
                title: "Visitors", subTitle: "\$90.0", status: 245),
          ],
        ),
      ),
    );
  }
}
