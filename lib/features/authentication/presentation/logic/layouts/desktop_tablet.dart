import 'package:admin/core/common/styles/spacing_styles.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/authentication/presentation/logic/widgets/form.dart';
import 'package:admin/features/authentication/presentation/logic/widgets/header.dart';
import 'package:flutter/material.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.grey,
        body: Center(
          child: SizedBox(
            width: 550,
            child: SingleChildScrollView(
              child: Container(
                padding: CSpacingStyles.paddingWithAppBarHeight,
                decoration: BoxDecoration(
                    color: CColors.white,
                    borderRadius: BorderRadius.circular(CSizes.borderRadiusLg)),
                child: const Column(
                  children: [
                    // Logo Header
                    LoginHeader(),

                    // Form
                    LoginForm()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
