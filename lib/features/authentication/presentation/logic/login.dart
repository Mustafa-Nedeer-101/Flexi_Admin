import 'package:admin/core/common/widgets/responsive/responsive_widget.dart';
import 'package:admin/features/authentication/presentation/logic/layouts/desktop_tablet.dart';
import 'package:admin/features/authentication/presentation/logic/layouts/mobile.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomResponsiveWidget(
      desktop: LoginDesktopTablet(),
      mobile: LoginMobile(),
    );
  }
}
