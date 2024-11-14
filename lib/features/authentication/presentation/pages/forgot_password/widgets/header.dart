import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/constants/texts.dart';
import 'package:admin/core/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Iconsax.arrow_left)),

          const SizedBox(height: CSizes.spaceBtwItems),

          // Title
          Text(CTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium),

          const SizedBox(height: CSizes.spaceBtwItems),

          // Subtitle
          Text(CTexts.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium)
        ],
      ),
    );
  }
}
