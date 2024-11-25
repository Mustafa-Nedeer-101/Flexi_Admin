// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';

// A Normal Container but with radius
class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = CSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.showShadow = true,
    this.padding = const EdgeInsets.all(CSizes.md),
    this.borderColor = CColors.borderPrimary,
    this.backgroundColor = CColors.white,
    this.margin,
    this.onTap,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final bool showShadow;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: showBorder ? Border.all(color: borderColor) : null,
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: CColors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
            ]),
        child: child,
      ),
    );
  }
}
