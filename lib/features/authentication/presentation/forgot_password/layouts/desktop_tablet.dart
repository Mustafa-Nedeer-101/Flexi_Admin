import 'package:admin/core/common/styles/spacing_styles.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/authentication/presentation/forgot_password/widgets/form.dart';
import 'package:admin/features/authentication/presentation/forgot_password/widgets/header.dart';
import 'package:flutter/material.dart';

class ForgotPasswordDesktopTablet extends StatelessWidget {
  const ForgotPasswordDesktopTablet({super.key});

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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(CSizes.borderRadiusLg)),
              child: const Column(
                children: [
                  // Header
                  ForgotPasswordHeader(),

                  // Form
                  ForgotPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
