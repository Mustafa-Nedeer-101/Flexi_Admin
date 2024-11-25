import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/common/widgets/text/section_heading.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDashboardCard extends StatelessWidget {
  const CustomDashboardCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.status,
    this.icon = Iconsax.arrow_up_3,
    this.color = CColors.success,
    this.onTap,
  });

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final int status;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(CSizes.lg),
      child: Column(
        children: [
          // Heading
          CustomSectionHeader(
            title: title,
            textColor: CColors.textSecondary,
          ),

          const SizedBox(height: CSizes.spaceBtwSections),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              // Right side status
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Indicator
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(icon, color: color, size: CSizes.iconSm),
                        Text(
                          "$status%",
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: CColors.success,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 105,
                    child: Text(
                      "Compared to Dec 2023",
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
