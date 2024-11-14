import 'package:admin/core/common/widgets/images/circular_image.dart';
import 'package:admin/core/constants/images.dart';
import 'package:flutter/material.dart';

class CustomSidebarLogo extends StatelessWidget {
  const CustomSidebarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomCircularImage(
        image: CImages.lightAppLogo, fit: BoxFit.contain);
  }
}
