import 'package:admin/features/template/layouts/header/header_layout.dart';
import 'package:admin/features/template/layouts/sidebar/sidebar_layout.dart';
import 'package:admin/core/common/widgets/containers/rounded_container.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDesktopLayout extends StatelessWidget {
  const CustomDesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Drawer
          const Expanded(child: CustomSidebarLayout()),

          Expanded(
            flex: 5,
            child: Column(children: [
              // TopBar
              const CustomHeaderLayout(),

              // Body
              Expanded(
                  child: body ??
                      CustomRoundedContainer(
                        width: double.infinity,
                        height: 500,
                        backgroundColor: CColors.warning.withOpacity(0.2),
                      ))
            ]),
          ),
        ],
      ),
    );
  }
}