import 'package:flutter/material.dart';

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.padding = 0,
    this.margin,
    this.radius = 400,
    this.showBorder = false,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFD9D9D9),
    this.child,
  });

  final double? width;
  final double? height;
  final double padding;
  final EdgeInsets? margin;
  final double radius;
  final bool showBorder;
  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
