import 'package:admin/core/common/styles/spacing_styles.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/authentication/presentation/reset_password/widgets/reset_widget.dart';
import 'package:flutter/material.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

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
                  borderRadius: BorderRadius.circular(CSizes.cardRadiusLg)),
              child: const ResetPasswordWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
