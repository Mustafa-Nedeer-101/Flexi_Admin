import 'package:admin/core/common/widgets/responsive/responsive_widget.dart';
import 'package:admin/features/authentication/presentation/pages/reset_password/layouts/desktop_tablet.dart';
import 'package:admin/features/authentication/presentation/pages/reset_password/layouts/mobile.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomResponsiveWidget(
        desktop: ResetPasswordDesktopTablet(), mobile: ResetPasswordMobile());
  }
}
