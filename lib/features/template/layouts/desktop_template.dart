import 'package:admin/core/constants/colors.dart';
import 'package:admin/features/template/widgets/body/body_layout.dart';
import 'package:admin/features/template/widgets/header/header_layout.dart';
import 'package:admin/features/template/widgets/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';

class CustomDesktopTemplate extends StatelessWidget {
  const CustomDesktopTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CColors.primaryBackground,
      body: Row(
        children: [
          // Drawer
          Expanded(child: CustomDrawerLayout()),

          Expanded(
            flex: 5,
            child: Column(
              children: [
                // TopBar
                CustomHeaderLayout(),

                // Body
                Expanded(flex: 5, child: CustomBodyLayout()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
