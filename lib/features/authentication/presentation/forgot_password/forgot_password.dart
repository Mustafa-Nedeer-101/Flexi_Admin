import 'package:admin/core/common/widgets/responsive/responsive_widget.dart';
import 'package:admin/features/authentication/presentation/forgot_password/layouts/desktop_tablet.dart';
import 'package:admin/features/authentication/presentation/forgot_password/layouts/mobile.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomResponsiveWidget(
      desktop: ForgotPasswordDesktopTablet(),
      mobile: ForgotPasswordMobile(),
    );
  }
}
