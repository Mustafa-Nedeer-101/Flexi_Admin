import 'package:admin/core/common/widgets/responsive/responsive_widget.dart';
import 'package:admin/features/template/presentation/layouts/home/home_desktop_layout.dart';
import 'package:admin/features/template/presentation/layouts/home/home_moblie_layout.dart';
import 'package:admin/features/template/presentation/layouts/home/home_tablet_layout.dart';
import 'package:flutter/material.dart';

class CustomAppTemplate extends StatelessWidget {
  CustomAppTemplate({
    super.key,
    this.useTemplate = true,
  });

  final bool useTemplate;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveWidget(
        desktop: const CustomDesktopLayout(),
        tablet: CustomTabletLayout(scaffoldKey: scaffoldKey),
        mobile: CustomMoblieLayout(scaffoldKey: scaffoldKey));
  }
}
