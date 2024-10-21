import 'package:admin/core/constants/images.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/constants/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.clear))),

        const SizedBox(height: CSizes.spaceBtwItems),

        // Image
        const Image(
            image: AssetImage(CImages.emailSent), width: 200, height: 200),
        const SizedBox(height: CSizes.spaceBtwItems),

        // Title and Subtitle
        Text(
          CTexts.changePasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        Text(
          CTexts.email,
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        Text(
          CTexts.changePasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: CSizes.spaceBtwSections),

        // Buttons
        SizedBox(
          width: double.infinity,
          child:
              ElevatedButton(onPressed: () {}, child: const Text(CTexts.done)),
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(
              onPressed: () {}, child: const Text(CTexts.resendEmail)),
        )
      ],
    );
  }
}
