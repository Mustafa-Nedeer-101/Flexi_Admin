import 'package:admin/features/template/presentation/layouts/header/header_layout.dart';
import 'package:admin/features/template/presentation/layouts/sidebar/sidebar_layout.dart';
import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTabletLayout extends StatelessWidget {
  const CustomTabletLayout({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomSidebarLayout(),
      appBar: CustomHeaderLayout(scaffoldKey: scaffoldKey),
      body: CustomRoundedContainer(
          backgroundColor: CColors.error.withOpacity(0.2)),
    );
  }
}
