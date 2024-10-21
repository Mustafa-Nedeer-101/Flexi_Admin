import 'package:admin/features/authentication/presentation/forgot_password/forgot_password.dart';
import 'package:admin/features/authentication/presentation/logic/login.dart';
import 'package:admin/features/authentication/presentation/reset_password/reset_password.dart';
import 'package:admin/features/template/app_template.dart';
import 'package:admin/features/authentication/onboarding.dart';
import 'package:admin/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    // Will be passed to any screen via the arguments parameter
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      // Onboarding
      case Routes.appTemplate:
        return MaterialPageRoute(
          builder: (context) => CustomAppTemplate(
            desktop: const Desktop(),
            tablet: const Tablet(),
            mobile: const Mobile(),
          ),
        );

      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case Routes.forgotPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());

      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen());
      default:
        return null;
    }
  }
}
