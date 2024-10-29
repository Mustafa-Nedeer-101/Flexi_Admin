import 'package:admin/core/constants/images.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/constants/texts.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
              width: 100, height: 100, image: AssetImage(CImages.lightAppLogo)),
          const SizedBox(height: CSizes.spaceBtwSections),
          Text(CTexts.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: CSizes.sm),
          Text(
            CTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
