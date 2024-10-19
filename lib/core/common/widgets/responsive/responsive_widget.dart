import 'package:admin/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomResponsiveWidget extends StatelessWidget {
  const CustomResponsiveWidget({
    super.key,
    this.desktopWidth = CSizes.desktopWidth,
    this.mobileWidth = CSizes.mobileWidth,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  final double desktopWidth;
  final double mobileWidth;

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= desktopWidth) {
        return desktop;
      } else if (constraints.maxWidth >= mobileWidth) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
