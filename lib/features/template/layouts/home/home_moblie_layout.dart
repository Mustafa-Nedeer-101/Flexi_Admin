import 'package:admin/features/template/layouts/header/header_layout.dart';
import 'package:admin/features/template/layouts/sidebar/sidebar_layout.dart';
import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomMoblieLayout extends StatelessWidget {
  const CustomMoblieLayout({super.key, this.body, required this.scaffoldKey});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomSidebarLayout(),
      appBar: CustomHeaderLayout(
        scaffoldKey: scaffoldKey,
      ),
      body: body ??
          CustomRoundedContainer(
            backgroundColor: CColors.success.withOpacity(0.2),
          ),
    );
  }
}
