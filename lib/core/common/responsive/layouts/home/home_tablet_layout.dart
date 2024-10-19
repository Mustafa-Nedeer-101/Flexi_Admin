import 'package:admin/core/common/responsive/layouts/header/header_layout.dart';
import 'package:admin/core/common/widgets/containers/containers/rounded_container.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTabletLayout extends StatelessWidget {
  const CustomTabletLayout({super.key, this.body, required this.scaffoldKey});
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar: CustomHeaderLayout(
        scaffoldKey: scaffoldKey,
      ),
      body: body ??
          CustomRoundedContainer(
            backgroundColor: CColors.error.withOpacity(0.2),
          ),
    );
  }
}
