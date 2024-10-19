import 'package:admin/core/common/responsive/widgets/responsive_widget.dart';
import 'package:admin/core/common/responsive/layouts/home/home_desktop_layout.dart';
import 'package:admin/core/common/responsive/layouts/home/home_moblie_layout.dart';
import 'package:admin/core/common/responsive/layouts/home/home_tablet_layout.dart';
import 'package:flutter/material.dart';

class CustomAppTemplate extends StatelessWidget {
  CustomAppTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.useTemplate = true,
  });

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;

  final bool useTemplate;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveWidget(
        desktop: CustomDesktopLayout(body: desktop),
        tablet: CustomTabletLayout(body: tablet, scaffoldKey: scaffoldKey),
        mobile: CustomMoblieLayout(body: mobile, scaffoldKey: scaffoldKey));
  }
}
